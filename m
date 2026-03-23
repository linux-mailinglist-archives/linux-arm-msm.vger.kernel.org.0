Return-Path: <linux-arm-msm+bounces-99188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B4HIisXwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:34:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F582F0293
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52E7D3053851
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B1638B7A1;
	Mon, 23 Mar 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diytOx1S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyFeLaRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820C7361DCB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261613; cv=none; b=fsf2UUCKgyy2fdj2zTRyVSvEtX9qdTiJXCDpoJLt7PNQCFHCT05sKBqy2yX96CZdG3G1uvOq+J9eZ4Y27vqJz+h3T0cwgjl1Q/+TcnHk5i9LVe4S5wZT0uobfCACoeYXaiCvoCYTtWtlgQAg5OLiHNmlSZ22b/ICBjrxOnqOoZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261613; c=relaxed/simple;
	bh=AhgCJKNKN2SuSP8pwgCoCXs1i0KPrcbie5088lH6RpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dp84L+pJ7UCRoYmzK6BxFkovqFEskhPfPM0tMDfnW+3SyZ8loFmzDwffyFZd/YyzSxOR5PfJQHZGtN4v+zLxJ1J/8QFCcuCvosplut7RKTSwNRo8fRSK9V5GZgJHkRcj+MlZBfT3oBO2WZ7aa57/eHn2+h9SEsHZulXZMNVC5nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diytOx1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyFeLaRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tEWd2291316
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5VbwRrC9FShcy8KwaAgA4sWuLUfupsur8ObOZmxynw=; b=diytOx1Sdh3WsFHi
	Cd7Lc6Jg/HWQZthIEO/UAtGuATSFQankHaEpNVlBF9vV+zfEW53La4NNp6+Xqatm
	v2FHXaLNvf8VzuJ6PgoSkoJD95nmO79eUDNRluI1bMXOYejWQDl5rdtHXsEImJ+S
	ZB/cMvu889L1xtlEsoc+DnZrgXWtPSymeLX77JpmLfuNDC0nUDBQZCpSK2RihOHq
	zyHIcKQg8wIwhyLQD+ZaD1wtsKCJuQIN9Ur7/m77MZ/TOgDrra9PnH0qALvnDS6i
	/6TaB1f8OL6OnwkYuuedqGRrRu55OGOqjEYwFQKLS6u/qo6qy08ILsGgOAYRYqNZ
	fv5Y9w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70h4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:26:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ef8c28cso18945031cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261611; x=1774866411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5VbwRrC9FShcy8KwaAgA4sWuLUfupsur8ObOZmxynw=;
        b=hyFeLaRYYcRje62+hQUQslfjhxyUgBht02Rg3O43TnMm5w+V3nwRg1JGSPL2iLX3gw
         s0Cq2SHN2Bu0oRkOFVm1zBOnFwr+DK8obGAkVUChLmxoKj0/QWB/Vk/IoljTRX7w7StV
         qLiKgIayNlomzktKFK/lgcMTRH1aJZspDBCC47gJWaeVPKDGmzzITBQj2djauMPY3kgY
         ZXVJmBJnU6Gz5z6q72ODDYlAJ9Ozo5d087JRJSFMVTOfrO36QbIERNSEZqImaO6au/Nf
         9pcUgZbmQTmI+ozXNAnhL0iyejJQnuo/sflppR1vJJRcAfcDuMtIE5rL2rKBeB3q4ys2
         i2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261611; x=1774866411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5VbwRrC9FShcy8KwaAgA4sWuLUfupsur8ObOZmxynw=;
        b=TWZmZy4oWQ1s54+jMZu7fbBP8q77rGkZC/egRa/ycqcXwZxPfJZ3zNlEtKqVd8uFbP
         ommR26ioyRs824Ti/0ViGwPIQjHH9yskT1tq3cDeEhKz7UAAXJQBi96hLbRlaXskbNQD
         gHyyhcnWwqu7vdcka90eRK+eibJ32leow6UQSvQeFdFYC8Stw/gf/UWnlTv0OMWD0Q0p
         3w268wTQei8n1hmUc61potDLakTQhHjS9f/9C6P1c0cKYu0XNA6hMiY64wj4ZqTaBvTg
         8F0aWCqFhkiszkQlwJkzAsfO91WoHWnhbTlKJEEmY62a/7y9xTtCmbDD/WLGk/SkQiCk
         cMtw==
X-Gm-Message-State: AOJu0Yy5vTUG/idAHvWKVLsjbBGTbfcQkzzllbjX0K0cGtD7c8dN2niC
	XXZHGiIESRN39ARSO2HjnMVihglm7Sx2sLFZG4sNt5mfuVM9UtRIICUbpiFpw+BKiQpFAhgav9Y
	rd9hUZfAQpM1feVl/HzvcFCVpVlNnOPaxg1lUkHUgQZ97jtZc3lrCQ8nIO4x5qeKUBVHI
X-Gm-Gg: ATEYQzyO3a0CLspd6ycwxo6NAGmVmsDLvqz2sqUoxC1JFIryCbTJpomcJKUD8ObzTTw
	Tf6VH8tjMKUHN36b0uwBbPm1v994QL5Nd4bZ+2WtpY3PPOe3njUmemvd13AWoGHGstHIYqthDVF
	GEqmhig9YIYzPNzEU0SQBhgVfq5XXKGEiMgRni+6EeL3897+Zm4cMdqvlGUEcp7Tx/1bfXhvY9j
	ikoNp1SKTPJxQptPB0XQsU1JMZ81D00a5TILlVmtHJXmsXFpdrgv+zy46O7nb1hjie9OW5AY/we
	iB6YF+CFTVdiJQMhPg8hGWDP2UXnoGnzN96ekiveXk9CbfihFiSEWQ/kkBGZHITaUaneOShwSk3
	as48R2uZAYMw2GdLaUej7u3YvYLwDAhbIylzOTETWtn9hwPcstQiZw7ADVEjq8SRlBdoDuoIfVP
	neMcY=
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr4089321cf.9.1774261610857;
        Mon, 23 Mar 2026 03:26:50 -0700 (PDT)
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr4089151cf.9.1774261610373;
        Mon, 23 Mar 2026 03:26:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm474908966b.1.2026.03.23.03.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:26:49 -0700 (PDT)
Message-ID: <3d75f9fa-f744-4437-8c68-16ca751193ae@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] interconnect: qcom: drop unused is_on flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-3-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-3-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c1156b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=E8RJyoIzjAt95Q53sUsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: xwv9bkQlfRg4uyKjRDkhXnt3u9-dW8MV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MSBTYWx0ZWRfXySPQT6InVZ/H
 uHllPisXijMfN79hE7BFJ0Jd4/3MVf8XXDOVBvymEu+nJoz0xDX7j4tPzvraTqKNTE15/lcQRDH
 vtkpOkMmm3z03kYBqHsDR2kP7/lN7C7FtaWiaQ/zBI6D0cCKc+7BvgM6N3c4+c/RCTA910Ewo4A
 /vbKoZLMcYDzMWDs3a6MCk3tTT89H3iNchmOda213dBC8q7VWoChZN1W3d5WKyDgKJi/PtlXsQv
 8GQu44hv6dcb+Y5uK18bAIPui0LOd9FfLa3qNrDw+Kor3OHMloFKPK2DGJRPVi8+3ehtbKIStlW
 cHilk36E9dwflUDar8CHrFhSh9XIh+CIPV0ZvuCEo01ht4n2Vz3IM1+iC7dZQtd21IKcj818j6C
 CU3XfqdEZUT59qm8t2mqxWFMaAebIfFJUQsM76OlZzagJbAMTw10CvgEMrMIegtV/MSs/vLEQEG
 G05u5aMOnk+rlQ8uDAA==
X-Proofpoint-GUID: xwv9bkQlfRg4uyKjRDkhXnt3u9-dW8MV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99188-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05F582F0293
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
> clocks") has added the is_on flag to the qcom_icc_provider, but failed
> to actually utilize it. Drop the flag.
> 
> Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
> index f4883d43eae4..3366531f66fc 100644
> --- a/drivers/interconnect/qcom/icc-rpm.h
> +++ b/drivers/interconnect/qcom/icc-rpm.h
> @@ -51,7 +51,6 @@ struct rpm_clk_resource {
>   * @bus_clk: a pointer to a HLOS-owned bus clock
>   * @intf_clks: a clk_bulk_data array of interface clocks
>   * @keep_alive: whether to always keep a minimum vote on the bus clocks
> - * @is_on: whether the bus is powered on
>   */
>  struct qcom_icc_provider {
>  	struct icc_provider provider;
> @@ -66,7 +65,6 @@ struct qcom_icc_provider {
>  	struct clk *bus_clk;
>  	struct clk_bulk_data *intf_clks;
>  	bool keep_alive;
> -	bool is_on;

Hm, looks like the clock vote is kept all the way from .probe()
to .remove(). I wonder if that's really what should happen..

That's what drivers/interconnect/qcom/holi.c does on msm-5.10

Maybe "iface clocks" are only needed to execute a ->set() on a node?

Konrad

