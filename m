Return-Path: <linux-arm-msm+bounces-97436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCOQCCTss2n5dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:51:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77035281C0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97CFB314AA99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6E538B7CB;
	Fri, 13 Mar 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eedGq58q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjVGYn6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BBE6FC3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399011; cv=none; b=nboLRvfP7pOkZcB4X0GLV9LJUSuL7SkMZ0WZYGeYwnjaWAnrEvY2p6Un7yP5QQJ8xlxLg8xA2nZXCO5mrWe8FUeviPUR8nbNIZZ8+V+zxOzhoJQesKIMsLx0NJDR3QGcdzah/k13KddfSIokx/qhmYPWYgj3iKLravejXYzchr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399011; c=relaxed/simple;
	bh=aps8mFovGZlF1yvFqIvQlDxUebp7B5Obn1q2i7KjfFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7u3niltlVjixfyJhKvD1SHUKYcC+7x4TVIDpFRxk8Xm+UxwbxBaZPZfVNoYJpnTTreOGXyYpkmEhLf7WgkzGxQgLAYIcxXVBy1CT5UOJ+MzQmb2RdwY7pOb1imIaJZjHp4rmrM7VOy6oc1jkl/xItKmIFsOS6VNBx/gfW+1NN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eedGq58q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjVGYn6O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B3vN3906278
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBkgUQGXepS8VOkWnzpVhui4Op9wXcFLhgxSgyRZRj4=; b=eedGq58qab40pewS
	Vbu5u08TeDatsqm61BVjokT+CTJjW+LMc/WuJL7cGFQbW8+ZGRLfgUov9SX6Njqa
	X20xEW17MnfOiUHvGU0Km2VRJ4wNNf/75NihYX39Hk0BEOQnw3w5bJz/cFALFJKu
	M64zUBuyoeeAQOFMXmZCvAkHbw/vJ8pjHnb0CODY5dihZUmO8LnSj/EoKanngZ+T
	uRyVysEvXpeBPB2p0vX8Rr8BEl3fHAh+q3RmAezfqpbPJb8Zq6H5Hmx4vq7gNLmd
	i3SXpAt5yaNWWuj+09dWuFmcrEsx7p+HCAI0eWDb3ZxX/RAOBk4RBCJebC4HeBMt
	KOvQmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8bdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:50:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8198fe16so128833785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773399008; x=1774003808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBkgUQGXepS8VOkWnzpVhui4Op9wXcFLhgxSgyRZRj4=;
        b=AjVGYn6O2Z78blGxSBE+tdX4U3lqMfxYYSmm3FieWsZUz3SlGWpOrJKFsKsZ4XYi0p
         mXEZISyUhIytnLH0dgVV66bPtdiXkuD2r2blpCrg+zMwMp3Wwi3/OFK/X37Zka386NSp
         qVbiQHNVcCgmzBZBYp4HBmebyN/Dc+45dU19E21EA1XWvPDD+5wneEmUwuQzqIlYGyfR
         t8Ud/AtI1EMN+xwESRlP9VBuuMfzhNlgSIHp2JN+0g/ULdz094tTqAwbuLYR0vgPjtp8
         BLgpI9GZtuoohUI+VQJfDc64GZ86RNMsMhnwDDAZV9mnujfPV44MsVQ0FBA/UGsJIH1B
         j0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773399008; x=1774003808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBkgUQGXepS8VOkWnzpVhui4Op9wXcFLhgxSgyRZRj4=;
        b=mtlP8oxiBYwi6I9btvAIT5uSW+Xq+Rno5a0VriUp014sdG2A2ueP23YNtkT292FhwF
         MDUn02zQEqpUBQcOozTj+usE9SHzdrO8ahpGMFF+P6TKsjMLw127SGhai+P8x5ZvUBMx
         eA2IlOn5FPtHQAuVRYoJIjLPMCgXH5NDaTVQSyz8rk6cNUurrbC1lsZx5e/RC6P79z5i
         9CTkj8am9x/7UQ6zVXHy5fRd19wGWglfHQAHomNVw69xiw1HwhoFq+fs6rxkPa1ZLVnl
         gFRRSC1PX3x6ZP5AV8YPwt/cdw4TdbSFNgVy944V1XYD0ORbT5fBDHr1nBSNKJiWsiN4
         nQuw==
X-Forwarded-Encrypted: i=1; AJvYcCWKN/7eCpogbzrAugaXHpwHS1mux2WXh99bWOz49XZQvs2Zl62nb4V7rG3KbOw+Py21h0q0ojQbexsCFubW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoeiv4fu163R2hZPoiPOxk/MbNxhcSFGEL17UtqARzCVZa3Yvt
	VJl57Wd9TyDydczqaa1zYTWIISo87bDxKwww504ee85lEJPUYUGVC/e6U+Ls32CqVk5/WGMlLNh
	9+R3OTUQOR/V52x86XLbIuNa1Cbq119Amcnl4Y8CSfzj9JXTt0GKf+1zaOm7RFlULvHvs
X-Gm-Gg: ATEYQzzWWd2kJXOGzo6vjBTTyfdL8azNKPCCxa6h6vuO8P1aqgxiMmVGwnR8ehyZph8
	HxRyYj1iluNZs7VDIMJqaXrDEDRbflkK/mibKefPJSLSsSpCncs0+QvC8QHjk9TGscFCirfLKNY
	FIxk2Aw+LBrWJWDqwO+5sBbCYeKRm50O9FoMxUxrE9pdiG9mevCQSDFiKlzluzQCbllV+0vVkhs
	oaEQwZinAatLWwWHznextHd0jJvC/D6tB1IIb749hILuKoSdqmGUkKuZlYPwmIP7g14nQrYbrtP
	2TMQs7Fu13xHl58U6RY1NcMN+A6IKEBncII2FrZKu4rnfsSa6UWsvOFX0HQskAZhglXW0su1V5S
	JpRJSkJGE3ZbLSoHUx5QNTxNX0lLo5QEvOXSieiAmwW/rVkyutyk31D+Gt8pm/nRoB1jahKMBQj
	OOc2c=
X-Received: by 2002:a05:620a:290e:b0:8cd:8736:9fc3 with SMTP id af79cd13be357-8cdb5b8a614mr303373485a.7.1773399008221;
        Fri, 13 Mar 2026 03:50:08 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8cd:8736:9fc3 with SMTP id af79cd13be357-8cdb5b8a614mr303370385a.7.1773399007766;
        Fri, 13 Mar 2026 03:50:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1204251a12.4.2026.03.13.03.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:50:05 -0700 (PDT)
Message-ID: <ac0fc154-b41c-4273-ac5f-408428c360ad@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:50:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] clk: qcom: camcc-sc8180x: Remove wait_val for
 Titan GDSC
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-10-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-10-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lk4Fb9mVzSCSA68mO5ItHOc-B0jZlDHQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NCBTYWx0ZWRfX9qRKoMbViqzL
 mCYr0jWCtrffxyRWl69NQqTmHt13B0kY/iiaYOtyoJqO7hZk8emMFD2k+vHTb22r71FdOFJFdmO
 FcFFlC8eyvumvgE5H5IBAkNEEw7qbT1pzoxF0Xam6jY00MY7rFx0+sP4Vyk0ftMECkwXg+HqtoD
 ZJ03IdETrdjxXY5K80to2yDfpEjpdn4XyxKWYywPF+Hin2MJTwGyMfrmA2g4lC+zWNX+Xml339X
 AILmCVfXyZL4c438Tb/6WyqCnqY4ROTu9Qmd+aNOihZKyhs0aKHtVUvda0v5oGsHLeoI/blVYx7
 l6iFOkkBzDmFtrBmcbAr9BrZyTHjMR629+mVP7JNZm97kCM45nvf9l1YMvprf/CdNEphClMxvrT
 cgvjeAlVNAbUWxRv8k0K3592qBGMeLwQDecF9BDjvj+GC/UgQqxJ5LgQPbAfP6wX7+tBLZ2wqGF
 IVma7bdiCJZpDZWvG+w==
X-Proofpoint-GUID: Lk4Fb9mVzSCSA68mO5ItHOc-B0jZlDHQ
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b3ebe0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QN4KUsGz3BfPxM-IDMAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97436-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77035281C0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:12 PM, Val Packett wrote:
> These values seem to have been copied from newer SoCs, but e.g. SC7180
> and SDM845 do not use them. They seem to play a role in causing the
> "titan_top_gdsc stuck at off" errors on boot on the Surface Pro X.
> 
> Remove to fix.
> 
> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/camcc-sc8180x.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
> index 388fedf1dc81..cd4c40a81c28 100644
> --- a/drivers/clk/qcom/camcc-sc8180x.c
> +++ b/drivers/clk/qcom/camcc-sc8180x.c
> @@ -2538,9 +2538,6 @@ static struct clk_branch cam_cc_mclk7_clk = {
>  
>  static struct gdsc titan_top_gdsc = {
>  	.gdscr = 0xc1bc,
> -	.en_rest_wait_val = 0x2,
> -	.en_few_wait_val = 0x2,
> -	.clk_dis_wait_val = 0xf,

Those are the 'correct' / on-reset values which if absent, are going to
be overriden by the driver, with values destined for MSM8974, so please
drop this one

Konrad

