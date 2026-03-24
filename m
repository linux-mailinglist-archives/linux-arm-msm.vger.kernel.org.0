Return-Path: <linux-arm-msm+bounces-99580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPtqEiZXwmmGbwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:19:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AC3305790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1742830162AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD373D7D89;
	Tue, 24 Mar 2026 09:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onaQdV9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5hud3nc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CE83A2544
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343764; cv=none; b=J0k1PWz86Ib7nOSRdgJe4TyjXach4v+tLLdmyawv793YHd++WcR6zoFA6tPIwy6/fVtHBxXxmcJOkXO6JyT6kc6sn0T9bqN7TmuJT9uzvy48EbgBoabtiooxkLFG3SBAqgcJrTjcJHMK2oP8reLb+bcaz9aB+Cv1vqBae44dETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343764; c=relaxed/simple;
	bh=f90JFQAR7SS/6U0xp0rsw7H7Hgz1D1m1MVHNZhHxMUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/0Y5GRG71SP5nCIdgsgOQ8khFFF8zN0fB69dDVERdvCwaqgN5gSRbYCr5aZXjle+lnbCNmUqtCG/6wVk/FJ8sOAdNhowQF2ej4H0qB96PI9EWSNOHg1VVDzQfl1CWaYGBtOxaQKrGx+5RZHg8EBw2UrJGhKjIuOB7W93YrI/f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onaQdV9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5hud3nc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3IlNk3171033
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dH5QeYgS6MgfEbAtRtBhmJMWeH1j1EC72OVoG0cGiw=; b=onaQdV9QwqnxdTNY
	ejmJu8ttuOsBE1hqTdPuoa2bOCgu1Xdxr0uLf4CrkZn7rqSnvmuKbAXTXH7efxMw
	+0MsYROLSoT4ybXN78pK7iViIjF6TyaJm8btamxUGlNhWqSY2vTpNPYwqETowg+6
	vfQabQlstDKotsdiHt8K6fsHQf7iumFZxtG8pKZUj6X2j5oqCINnFstIsilX1Rxl
	uOmnc5NHe23VQO1/rv9esXuo5DHtVFe4U4yfZp9CJWQGi6C2crr0cVWqR/wDfN65
	SASLNj0jje1OGh2lLqe6ljoZsuv4t1YhSqiLiYZLJVp9RjgfjZ/v381X+y6T6j7A
	HsjH8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r23y46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:15:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2d5e61f6so31526011cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774343756; x=1774948556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dH5QeYgS6MgfEbAtRtBhmJMWeH1j1EC72OVoG0cGiw=;
        b=B5hud3ncd78s5JJdUjBCjRi5q4OBHoIAvILgdm2FE9900rAI4w82hwGAcXOxodpu07
         bPASWGH0ZryDeb/0U4xFwBipBR+kdI8x1qbraf/W/qVCFPVBfl8adPJTTd1SK1zTstr6
         PHvbMoV5wF0NvJFyCHkXPGLt+MpCe56BrlOhTB99OCSz0BHxbjauGpcoi8CT/5BtNGIo
         YhqA/S3Ahwn6DYUVkLjOQJkmo3FIRQqGMD77jsA/pHsj+TNphY3oiDqmy8Gb4EUO58YG
         ISruOYw9o5+6e6u1jQCAU4MQFT4a+G4keIZ3EZJbFPMLGW1Cc9zn09WtgVkkEruk3ZsF
         wACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343756; x=1774948556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dH5QeYgS6MgfEbAtRtBhmJMWeH1j1EC72OVoG0cGiw=;
        b=QqqVaMFShklt8LE/aFXYrOtoMxQUq0aZZu1RuBTo3p5pQ1L8PX5CNitsmbu8BX+4VT
         kowkVdJtfyKYK+RzI9g0cSn8nJOmk+ZBukkhz59VOp1x2TYHiwGDj2GssQoYRWh6ggun
         8c3QxWrfSD8eXIESKPWCr9ACcTwVNouCSoZYs1ICotugBf+t0ipTpcX84xEayggG8gTj
         l1Mgf+Rl/YZlOBMVluvdZguO4OZ4EPZaBkg4cNaHLLNC2Os1Q/JCNhrlSWjN3p6S6pzk
         fNKQnn4xDGuTd5m8vxDfxQMvJWdQaDq0O4eUC5gQLXgT/OXkyPigXCzSYTa+u1EIQsS9
         YSFQ==
X-Gm-Message-State: AOJu0YyxvtSpp7hQ8/fUWDg5u5lpjg/0p7ywastaIDJMvBt39Evd3GAu
	M/lfxfq4imQ6WmLhqjmBBtKz03Q2dWcp7I3BNibeTM8c4KQERXEyVQ+1rZQIriHKURLAncolglZ
	HWtFvY61cCksfEAwHM/GmELdHcs5q8bL0mfBfpBSqtZgVyHOXbWzFVVTsgvj4tVXqIZ6T
X-Gm-Gg: ATEYQzxyuvThbh/x6ozUc+eltkiwYk4iFgaRI22yJX3UP4Sb/dl39e6+A895RGGqVd0
	sS1wBmj54w8lFVozQW0+FlsU1cRROxv+zpZF0+lqC4zxs/aeMrO/jO2FoQzIRtpf9rrnsOzE5dk
	0gk7z9mpQs/8QmMeUqLsMjqBxHBjneMPjpRupEkY3mFeIaAlrNF+UhGVK4Lg6QzWIDMtE+kXer5
	7FYbf9ZLLOau2JkRc9Xmc9moNfC7T9eo2RC8zFSC5eYSGXSlayHUk7WfDa84SRObC1qPpScNeWJ
	xhQIkPTsiQGL0eki3xjpznIibLzKLHeAOtfnMl/bL4eA2AF6oa1RSCq1tZCTn9TN1Nz9NqSMTNL
	hysWMhtbXkvSGT7Fesq/fiREN0D7GAaBVKocl5FrjvXcnp+JS98I/OW9+Tdyb1FDsFZ42qzyBsZ
	v1ecQ=
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr175828291cf.0.1774343756357;
        Tue, 24 Mar 2026 02:15:56 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr175828011cf.0.1774343755849;
        Tue, 24 Mar 2026 02:15:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98416ac27asm488570666b.59.2026.03.24.02.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:15:55 -0700 (PDT)
Message-ID: <b195f47e-9bbe-4fa2-a29d-b24eefc94226@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:15:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c2564c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XNfRLA5X0yr4rW59EWkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: YruvbU4iUqIA4-dlRPbWKE7Az9yAfWZc
X-Proofpoint-ORIG-GUID: YruvbU4iUqIA4-dlRPbWKE7Az9yAfWZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3MyBTYWx0ZWRfX3/N8q2SOAlv/
 Z6n+hQ9cE37Ru5qvdF6Ov2H9pD1PVXBHrqdxNEsmTkQEUrLEk4g+64rpyTOo1Z79LuS5/zp/qxr
 Dbaxl74JXdi1nnOtfom7oAq4SuPwXKqR5QDOuavLiTXGIPiQ8ETrUIHvt6Uoq1YAOqCdnJ8+c9b
 214k355wT5EYKYOQPWliKtN6iZFJlglYwkHnvSYi+JKyW8Bt9nKhXAsMZ6ovmAvDlhgPNolquil
 69GBKVU/7MQH524CWUr6dn+BwR5BfBM7DMAIF8CdqNa3DCUTYovT5JNYFIBmp+71oxnVlrjY1eW
 kPWwFDZS8y13wuoYZ6UP5RidEnhj2V0wxzrB/pT2YsY0LTFhdxRfU4oaoxjmsoy0LP4tKZL//vh
 sjIwP1IcsSOjVYTekkhP1yxB2N048IOBh/45IJ9nbf09ungEL0EhAGQnWMb8lG8MSNryF/2Ck4y
 2OhEeeNjOre83xV8DqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99580-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8AC3305790
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 7:57 PM, Abel Vesa wrote:
> According to internal documentation, the UFS AXI PHY clock requires
> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
> the UFS controller fails when operating in MCQ mode, which is already
> enabled in the device tree.
> 
> The UFS PHY ICE core clock already has this bit set, so apply the same
> configuration to the UFS PHY AXI clock.
> 
> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

