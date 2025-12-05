Return-Path: <linux-arm-msm+bounces-84432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14DCA70EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43AE53045271
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DF43164CD;
	Fri,  5 Dec 2025 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmyPj5wA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ii8m+/1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE902E1726
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928492; cv=none; b=tW73lOf454spxCN8AoagFNVasGafdtjKDui6rMpA0j/OjhEPnLQTeG486Gf+YmDYa4Wq8LEp6zg4Gfzvh+DJTUz1aW3/GD/5lZaEg5LsDir/6O4ClQdlo7ahkpGHSoM04iEPfc2ihz66CJd6NkD9Nake+4mLypZJkWQWWW4Mx98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928492; c=relaxed/simple;
	bh=TEHHJi7iUF/zH/xJ+LuLXROuEQq+DulZRvZUqQz2Zzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yt2/gcGY3CgQszTDSh2Qyd1LwLDY5YvenUcm5kSVgw1zKbBuQn0pRGqan49USgVoGWdQA2tRH2tueRqcDH4sEyJjjKh3IUwAr3QZ8OlpRcoFqIcYn1lyACN06455ukoYVLyv5vgrrqemdgnUGsWn3j3lymqFUGoO8fX0+dzyFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmyPj5wA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ii8m+/1R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B57wIkm2410859
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 09:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eoXuVJmd0Yvi0WW1np6mgpmdDWonVDRB259V+zh0G08=; b=TmyPj5wAEmHwDurK
	25qDPV76YEUGuE26CHTeFFQP9iNuZOMjUJoqIDk5UsIVvQ1mwjQ+OZKv3NWzt+bi
	BxNXJZsSmUTkGHytWkZ69roxy8CLDO1gMfQy7A2Ic8ozK7fzXZy3zPN1bV6lz1DK
	uUea7Be8uJ5crWMai48PPUZTuDu5L3f29dwl+afphnviYKOt6ZT06KazjoHKZN4p
	nyiFZViRnHXHcKUKzqfFtZGcZeBK5wxkQofa6uozEU8eQvn6po5gsT1/f+ZGlA/5
	ow9A/aL3ctIaYmOt46b8HtbNLMQ4G+VKpiILaofYz5FilJxY2yb36xbYhf4tqFLu
	NoluHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auhty9t4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 09:54:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88820c4d03aso5202656d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764928479; x=1765533279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eoXuVJmd0Yvi0WW1np6mgpmdDWonVDRB259V+zh0G08=;
        b=Ii8m+/1RMiwuOBmF1QfKUc9T4pBV8o3N3OB85S4OdbC+88ZNjLkkVRJhlHXDm0Tgqg
         cslYnqcXAebzFiuBUlQQGF8u9KwP+M/CcRjF+ch4yqW7p4/+4Wsm7JPH49JefP7DPqpP
         TFiiHndFpKgDHN1a2Kue/1wVMs5JY7pPh8NqEdA3GSAtvtFD82fN0PdfPTSM3SdV5xme
         E+NM+O56drWLFaADCjhmQ34rmTvDVwd+vv85aMGxTjKIfEeLwfqXeIm6wD78MT53FOZm
         9TdfCkfvsiaxgLdbPTC/1OyWNzBh4szK1bkk2n9ScIgr22No+g137IVu7DiJapo0fduz
         QvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928479; x=1765533279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoXuVJmd0Yvi0WW1np6mgpmdDWonVDRB259V+zh0G08=;
        b=OumGI4872GzD35vdblN4L3Zx63SvR6neFDgNcCv7KYHelWju8heJ7ubMovOUWoNFVi
         m8JD8/78g2vctZYbUc/nVGxOdbDku3z0hVDUp3ovib4kRAa+kXAH3zftFdiOhbPQy+ij
         H6RMMjBo/8NahOGn6rHTmIWmVDdYh5Yn88rI33V8ksDfvIDItDy/4J7CGt/3zugka0dA
         nG8lqUfsBDILQHM9FAoKyS/evVXkaRMcktWKl/A+U9SaTDR3OJxaRXtR6rZkrUF4aumj
         Yk2XKOPNadIBW1tXuiltRnb/UdIjyagGWzCJwm7CZrzvMRV62IOwQFL8QudNgFieGRVM
         5U7w==
X-Forwarded-Encrypted: i=1; AJvYcCX4YrhJkAcJ8p+rQnpfuM3P3MOxUnCcIXAeiaC/Ju14Jxvd8aRXPH+iZXp8kDDKOFaLg80SfRkmM55FzGhR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3bpHEz+uThghAzKuXUW3vGQfgtRq5rF19nI5ySuwS9NzyVwur
	lYaHD/RrS2HrYd9gMc1Z+dUYFEC/HrkxH01reTFDxzP7RIQuMFpbKkwbbajqezHzUHAjG0J1tn+
	O2/QYN77CQ9GuaqnoA9wQtifGAZMO93Ng1sQ2YhdEL5ti8KyTaLmouE8Ix6DGHVjW/9Pk
X-Gm-Gg: ASbGncs15T8ISmQ2NH6mgzxP4LCpT88yd4PC3nG8JThsaF51m8XlCQlC8eQhzuqtQVg
	MlLwhcmeWq/eOQGbwLH1LMUgdEt5hdzlBXh3czZPlHAjVKB5XGtrddvdtYSu50rOxC/4p8I06yB
	aXH3ZrOl8I1gXP5XDSnwB4i8jFlTKZarhCiBAD4aC41SbkzwhW1gTLHrzPAxsscwrsvbsL4HWd+
	oqnHpqqsziMPtiMdFQLkcV9zl5NJeqm3JoCz1PtpJOzbKlmF+9950mqUtuAWsF9RLBssqSm+Gvy
	PXOwGqTG2MfiM/Q9mL+hmcdRnKLXr4P4Ymu61OLXs5PV6RZVTVTcuIDnrOl8TkYm8lBPS1Xe1A5
	STxgduB19L0Y3GXcNaApEbNgdnPNLoGQgmbTZpAgy+7Qus4YbtCatkBTFQSahUXWXwA==
X-Received: by 2002:a05:620a:3181:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8b5f95115dcmr810341385a.10.1764928478594;
        Fri, 05 Dec 2025 01:54:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHREJakqGuPP0/p9ZNgRVSN71Fl2S+9EZh7bx7QbGSTPTv402r7qi+l8sQMgcQVA833WnD0tg==
X-Received: by 2002:a05:620a:3181:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8b5f95115dcmr810339685a.10.1764928478077;
        Fri, 05 Dec 2025 01:54:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b3599050sm3377608a12.17.2025.12.05.01.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:54:37 -0800 (PST)
Message-ID: <b7fac86c-15fd-400b-955a-c331c8bc681d@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 10:54:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 CPHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-5-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-5-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MSBTYWx0ZWRfX1c8WlG7sUgr/
 7VZTiiKInPq6S5ZbcCXTG1ZubEZkiQsYXDjCX29rkZTeU6cDXZ1iCwAXmSYqmCp9zyWYJ3Q6/Q6
 iP9vE6ouMKMdgPcONMVYdjRyRP3K8dNA8ezAqXfPgRHs3+U5xN33T0Dpi7jKm/xu/eHNrfrFvmY
 2foDT8BfmmoW4kITCuRMXyyAA58oEsDLgiYak6uLWSBVwGqNBssgmQIjmAumJqURpdzhPMDmG5y
 7qWYAM87eMFnTuKrzdAphXKq20EJp3IfG+w+2IiOX92cPlMfnWYrMzbkW2m8TmZnVPy+VdpqcuZ
 alzYiFNlLXsvKWj3Apkb+9DBdtVyPTOz8fBVOurSkA2XW0nrZ1u9APXujW9E78sWvwT9TtFz/9h
 Xh8AGHfKMPwOADqbxPXNng3adzKuFA==
X-Proofpoint-ORIG-GUID: 5asz6yytF3Et0wCqBLKvDpGE_D8zD4PJ
X-Authority-Analysis: v=2.4 cv=DplbOW/+ c=1 sm=1 tr=0 ts=6932abdf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=797EPeVL1EFzAZkSmJsA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5asz6yytF3Et0wCqBLKvDpGE_D8zD4PJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050071

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 74 +++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 3d30cdce33f96..7121aa97a19c4 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -145,6 +145,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>  };
>  
>  /* GEN2 1.0 2PH */
> +/* 5 entries: clock + 4 lanes */
>  static const struct
>  csiphy_lane_regs lane_regs_sdm845[] = {
>  	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -219,6 +220,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>  	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
>  
> +/* GEN2 1.0 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {

Here's a downstream snippet which seems to have more up-to-date settings
(checked against a doc and it seems to have changes made at the time of
the last edit of the doc)

You'll notice it's split into 3 arrays of register sets - that's because
it applies setting for each lane.. something to keep in mind we could
optimize upstream data storage for (they are identical per lane in this
instance) one day

struct csiphy_reg_t csiphy_3ph_v1_0_reg[MAX_LANES][MAX_SETTINGS_PER_LANE] = {
	{
		{0x015C, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0168, 0xAC, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x016C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x010C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
		{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
		{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x011C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0124, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x012C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x01CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x01DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
	},
	{
		{0x035C, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0368, 0xAC, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x036C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x030C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
		{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
		{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x031C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0324, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x032C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x03CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x03DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
	},
	{
		{0x055C, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0568, 0xAC, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x056C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x050C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
		{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
		{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x051C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0524, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x052C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0544, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x05CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x0564, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
		{0x05DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
	},
};

Konrad

