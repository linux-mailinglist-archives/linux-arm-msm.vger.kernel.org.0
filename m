Return-Path: <linux-arm-msm+bounces-88676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F60AD16FDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1F2A300FE26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6D9336EC7;
	Tue, 13 Jan 2026 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8Y91ILd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wr0QUJd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE241BC08F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289021; cv=none; b=i8HYon/qlz4XzI/+NyLdcKzOLykTfX/JF1OnzLs5eEKDEXQICapXH2UIOZCDOQPyWLu4hKf9Rwc3SHnfPGzsCXh/T+uAouUp5LZnCcwQ6Hud1+CyY4m8a45zrXXC4MdxWnsovxoSkRUCEp8tj5SkGCxEItazUwjQu8lN0UBxs2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289021; c=relaxed/simple;
	bh=RX4UBOE9tCTa0FI3pKdIvODZ1uSshGHS7PWPsy046Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIy7Ksm22RXE0QLjsRLHYCgT45nb2Cl27/evMeLI6ty3B+yo58OFLWgpZmG3wRamQBhoH7INIsQ/22dyERqNyEsZWfW+ePNMq5li4Opae8xDGjW1z4qR6ciMtIYtwRWYwQhj9K0lQ5o62xAkZfWf7BQ/6WjnHstSPPYGlVv//jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8Y91ILd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wr0QUJd4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D596pl2835085
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNgFazqcMlu8myL+AuN/JIcSjpDYbPE9dhbXciQk9os=; b=O8Y91ILdxqEvLqd4
	nqY0Nno8epFqtZnfnCRAPOEvBD04AcvdxfwnDX09TL74yJmC26PHuc2jmToWsCM+
	MZBdhtFa9ioLHKDcxfZs0O1s8VLhRcjYK/UNJ2pi+5NN8anfPQJu/TEzpNY9qze5
	vOhhKCGN6KkBobCL1j5uKitDBdsAekEKmQeXJRoGy0O/YTJqk3jKu35NCWTd9mXR
	R8rVqEQtJsdaeRqVa2nOZ56yCe9C6TMzF0CF/pOFEg4XoNI9RP+gUakbFBvgbId0
	jYbas+YmNu44/2XGJe/VgPrS+tQbjhJ4wBL3nfVXNG5w9kq6hYdMRJ5X00uA2/VL
	RWThdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9rbbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:23:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0e952f153so189971155ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 23:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768289018; x=1768893818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNgFazqcMlu8myL+AuN/JIcSjpDYbPE9dhbXciQk9os=;
        b=Wr0QUJd4uFkIjXfoysb+/ZLJgZrXTiFkKoQjxqv5KNXHjZN5KiO8gpmpUfddjHtQeg
         mwWLCAn4lUPT5p/+AcBctqlJtk0WhO5k8ZeLY9PqOMzmAJX1cL2pVbRHuf1pfludl1qB
         T6Q8PSrGkGHTr97iLe7NFaZnQ5YvcnoPfGYni6MlRhzM27HqD0zj5vZlewtyzMn8TN1A
         9B67qOQ2ZLCZrwI98CFpKPr++EEgBhpej4L9HQ2k/pZBOYd60NVp9/0hkyUWLyrFU7Ri
         AVjSXEHkOXqjjrcmkShVNsxYQix1t9nWJ7q1mT6sx9CdprfFLpk6UIzTSxt94kwMQBwg
         bmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768289018; x=1768893818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNgFazqcMlu8myL+AuN/JIcSjpDYbPE9dhbXciQk9os=;
        b=al//jBDKOGdk93imRXooQJBTB1Wk3LeNYJpxKNbKcRTwoJno2hlAEzDBElR5k+zcpR
         6Zch25lfIWGiPJCtglrTArTu/7dUVaXNt115WlCtmvPaP7dEABVSYb079ePedWSUkvwc
         e8RGtj0L9HXyw5DLsxeyUwHsuREfkx0klvHYhxNfKjQWMBJonhWmaUYZPf8XwITtkNc0
         tXUmCqSbdXIr8cTQjCISvBi4PmBfH+dc6bTIigL+ernra6UWGCO5FKa3aTTn4GjH+yB5
         rxL/AEZYGFVJUYlzSZrzhKoXM4weNRFZqrXj8TuEv1lHG9vPD5pRjIFyaESzgPNczGH9
         lFfw==
X-Forwarded-Encrypted: i=1; AJvYcCUIyAuBrmjJItbl641+4v52v/ChnVxLpPlZnLTYWWLtiMbROmy6vPvGYlhB1bPuVP1OBfIlD79/SeL5aaPx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb0jl7cB2NIkL0goSpIneqht0NrbY+10RSMlk4qwN1LoJIS65l
	FYK7TBKuxVUJvp8ckrcoGxb7n3nyQka4Ku6BVOZCxlkEE0nIkXE+mBxRrfGXn6LdsyoDTBQZzpy
	jnwVPvbFPENI2nG5NCMZvKv70UYpSTyHRERAmgTD64LgCN7ku8WFhp0BlpOxHPI8PjU+u
X-Gm-Gg: AY/fxX7QAf0kgKLnB6dlpCrVpSDoTID6ukxB9QvgfgHiyK97Mu1io6Sx289Urg3plGA
	C5Yl4xzm06Dt1l5KoHicIB8KbyyrCL1oRuuWrhDPzZkuBzEuy9tZo+7x6jS1tOmzZuy0+rr+4fr
	DC4OusKy25SThpJfTzrUZOYN0sZIuAWdAVRObUfGTtJE99qomlEUiCQDzbzF98/HF6zVxIZpCyy
	8Nhhe3ui7y5egwviIJBz/5got8xd7zutxMSaY3P7wzvLjkRiy/M5deLgBJhEoWTM3v/R+wtRs+w
	SCkZj0SvRssg5twOis1T6oA7zOiU826/ubo726u1MoARxVH+kI938IkH4snh9wL1xiD6Hl283mi
	FLZAXBgGkQCzOMMDYbNx4ZeNtmU059bjU/JMXAxyKG9Qzadlb7t16YlRiJTyhCDEFaKdCag5Osl
	mgkAE=
X-Received: by 2002:a17:903:1b0c:b0:2a2:caca:35d2 with SMTP id d9443c01a7336-2a3ee429933mr213782245ad.16.1768289017699;
        Mon, 12 Jan 2026 23:23:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwDEFvz6AypcTbvFw5c0lu2Oo0n+YreDV6bmdNGs37euaqv+jPI2MpciMHjODGQ8L1iQ3/Nw==
X-Received: by 2002:a17:903:1b0c:b0:2a2:caca:35d2 with SMTP id d9443c01a7336-2a3ee429933mr213781975ad.16.1768289017228;
        Mon, 12 Jan 2026 23:23:37 -0800 (PST)
Received: from [10.133.33.201] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8920sm191440495ad.85.2026.01.12.23.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:23:36 -0800 (PST)
Message-ID: <581a9672-64b5-4df2-ac9d-bd3dbc1730e6@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:23:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: edp: Fix NULL pointer dereference for phy
 v6 (x1e80100)
To: Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        yijie.yang@oss.qualcomm.com
References: <20260111083317.604754-1-val@packett.cool>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260111083317.604754-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ar0JolYfwbZvB63uWyZzpo4ofkh0kY8J
X-Proofpoint-ORIG-GUID: ar0JolYfwbZvB63uWyZzpo4ofkh0kY8J
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=6965f2fa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nuEKUdX3l-reoJBA14YA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2MCBTYWx0ZWRfXxSNGr/Q+hF5Y
 Dh8+8oqgkpzye4Ygy5hlA4d7EHAT7DbNCefFtxr2S4OS2D4kEnA2nJJXHMj5V1rejrUN4uVpdqS
 GuP4STaV9W30ZK0Fqsp3gvkR8x1H+7RB8QwLVdRfO8yClvxQy0EqXmsBvUYRRt1TROaYGOPqvy+
 C5VXN/I2w4yBVByRF+pK2m7JSb374KjlFIqG6ICJ1llIJn5BZWOLE/yYb77UZalbcPAZj4b1YE9
 9cJ2RsWQsobvHsBwRO/JDIT5O4jT7VqsnUvv8WjZJgkW6pG1sV5FQL6hSwxiowL9zZiP3FaySGP
 I18ErZUa3B9U3WjdcFfBkw4TPUlDZ7CstiQvDy605mupf/I1jDGUPRMkDz04D05H51pK+/Jb0ZX
 3HSlFhdh40DejMnhb9QuP6Dq2IUWogSboJLEpRrFflPxi9LXzpvjt3YrGhJ++YxWAri7PogPrC6
 W6FXMyo2Oc934orZG0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130060



On 1/11/2026 4:25 PM, Val Packett wrote:
> For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
> stub implementation was added for the v4 of the hardware. However it
> was omitted for the v6, causing a NULL pointer dereference oops on
> Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.
> 
> Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: pull R-b, reuse v4 function as suggested by Konrad
> v1: https://lore.kernel.org/all/20260109045214.5983-1-val@packett.cool/
> 
>   drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 13feab99feec..7372de05a0b8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -758,6 +758,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>   	.com_power_on		= qcom_edp_phy_power_on_v6,
>   	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
>   	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v6,
> +	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
>   	.com_configure_pll	= qcom_edp_com_configure_pll_v6,
>   	.com_configure_ssc	= qcom_edp_com_configure_ssc_v6,
>   };

Tested-by: Yijie Yang <yijie.yang@oss.qualcomm.com> # Purwa-IoT-EVK

-- 
Best Regards,
Yijie


