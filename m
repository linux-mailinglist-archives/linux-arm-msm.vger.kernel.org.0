Return-Path: <linux-arm-msm+bounces-100363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAE9Euikxmk4NQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:40:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97943346E44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCFBA30488F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A4433436A;
	Fri, 27 Mar 2026 15:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyYCjA64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4edmrKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21730C635
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625723; cv=pass; b=mi4J5cphKoKDnki+iXMQtuqPKS2dfQqJOWOf1e0xScZRBo/ZOlw00UL1ucBe2agZ69Be97j+grxpsCjSWjOPhrvF6vgskz+6crfpG/WXbnP1MJM1Gan0Tbdz2YYGt4DC8gKIabgbmLdQqZ3TKne6sHi8LlHBD4bc+icuerZGQ+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625723; c=relaxed/simple;
	bh=7zZyH/lbSdSOTHBZXo+qGnWHJIuX5pvlxUZA27oLmm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4s1BK3Cfz4YVPocVLrIg5f1UgCjQqroJ3dgXWxscPlWqWKPHCCZPRJTVo3Uhto0NYGs3QJRirTr4krl3yYg2b/cBJSaGyBkWfNB6MFG0Qc9ik0hWpsNsZHmBVHmIjhnhKWHuj0R192Ccb8chY3jeEnPD25OrxD5NOGeGEkdnyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyYCjA64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4edmrKo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhH6l881590
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qMT3+ohGxmlygaS+sxIbWmQQ
	M/6eFSQ4GIWlBLpfR8w=; b=WyYCjA64TR9oM8i/l62fkgTnmu76loPfjwO+vmtC
	onl0WZLfpHTl6HAXYP6NBu4whjtyzXeFjrmOBuxCFLnYJg32uF5xOZa8sqxUC18A
	8UHUfm+ma80fwj9nYQZAJZKNL8XYyrMyDibtP/3mf6JOICp/mIhQ0ITGX1Okeom3
	24EwTqbysB8ilhu8sf+m8OuI7Kz3tFt+oDVPLtwqzL1HdjfpHSX472yyo25ywHBM
	rS6hr+YRUGdjmgU9GRoUPs8bHRF9DjMYXrLBOy114YP2SDDcpllkIL7YhaYsbxW2
	4Xo+Jm3bS8bLFwXSDOr96Z6vzeshujbR/n3yiGg02uR/gA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6kcbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:35:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-950be47e8c9so3669835241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774625720; cv=none;
        d=google.com; s=arc-20240605;
        b=c0t3oSHNkAfRlt5YRp2k4McMitnZ7MgqpbNel2uWUt3DDpB3s6X+VARFEA7FNEjucu
         o58JuYn02FEieONW8IRZpBlN0FlX9JDI2TSrAuBYtQjtyxi45w6sXyraR3h54U4e9ybS
         HTrvXT7A9tshiZf7GSbt0rUlhTwl0ASLltLVdC1KxG4mz4y7EiUs3lMzbcpOYJmkSwzl
         Vtd8wTA7alfULMFXviWS9xtHlvS14A+1A0CgKqzJCvUNv7a436V+gVE5nH+JnucQ68yp
         8vonUwFZGgQHWtMm8HY+7+GOEhHpGeCo4ues1g19LzVTOAd+QZ4gg0XD0Ck6zlGO5bEH
         AuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qMT3+ohGxmlygaS+sxIbWmQQM/6eFSQ4GIWlBLpfR8w=;
        fh=cSd/S4MRkqPCJ36cBXA8bbmJVcaCyLAnePh7Aqor5Ec=;
        b=JpBf4e5VXzWOY8IUzBGqiLt4U+BdV/XBuM+Pb+Ng8PFh6TSF8iEpa56jDoYU5IseK7
         9vvpUy2yhxkCFbOKZqRfRCWo8xpBRe9jXqFrhoKspWoBDTOvOeukv7+vU9yVj9VJcNjw
         vTdw88eF143STj5nRuIqOYtGWY9VKWX/EI2P/yQOtyHno3yQAlvNqXk5rR20KQRKkaJm
         YrMmQEs1/8DvtTmz48D8FYb11ajZz9QLVJ95+xzeaw0DpyyVQXGR0ILNfA3Xpzw9r9M0
         DOeJt+jAtwI9+owZkeGQ0Ph5HB7QuEtrJGrB7syo7LgaUaGcIqyAc9mkB6DVc3an0fQs
         kE4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625720; x=1775230520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qMT3+ohGxmlygaS+sxIbWmQQM/6eFSQ4GIWlBLpfR8w=;
        b=S4edmrKohsDn1W1dcamdhWJ2CfjLDS5331PAs5UOn2V8zPFtlS5AysRes5symtxlSL
         XRSVWPWsBx7nR4vV6a2QIOpu0w8bY8YdNxuqd1n8gbMKJbn46BIs5XP2gd+FP5u2evXU
         HJaMWxLmVkXcMSMJrPunyTWj9xTdj843Vq/ZE0j6Em0GbZupK/4pFwb5EF3vIA236y5i
         eBiJGoHKmyaD3L80Cm6IrPthskf7YzNEHo1Z6l0u80+nFKpm311/e2V6lTUnFIXtnzos
         vQCVAKMPxgV9gn8vNrxPjQm2jOYyybj48ilL0buMP/kGKySo86mQNnHxMOnnuTMlSKbo
         Fegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625720; x=1775230520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMT3+ohGxmlygaS+sxIbWmQQM/6eFSQ4GIWlBLpfR8w=;
        b=YGyGYTWdMTyAgxgBjlQp1wgLvmP4FvRPUvxoNl3OzJi9T/aF+ZvK+AgeZ/Igtz1A8k
         iXiIRqqUHFU+XkjDSJ1YC3pLzhRwLvZspUkR8g5y7TgUzLkDJV2kHgrP0Mcpp4TKYOOM
         oMZR/sMV7UNVeX5UR1Sq2Q5BAQgKTMwKlykkDyCm3QbN7YIskKhhWS+eZkffTfTlZAQb
         YmP4P/61iYpwGHN19HNJ7v4ddPd2zMlI21CFnZxHpsDo1Xg/E+VT4aRZU2LsLU4XKn85
         5ZSKlYHSY7Udr0J78mzzvK41VpkPLS6hHeO/RAku+ybhKpSTJoBaTEdB3QSw3g9HeVU8
         dDYg==
X-Forwarded-Encrypted: i=1; AJvYcCVLn2ZVH4H2M1eZVd2RpAiDdkkbfdUmjJ4s9gJnjwxwDpuCou/BEanYX276PSOMbUwr3VKWy6DT8aUu7uVZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhukUI+jVGXwdrOTvWFvS+odGu2qMAo0dAB+7Co1dYSQteyG6v
	OXV6CqS1Vq+wDeQ97wM0SLzGl0bDIqZxoqMgnWVVH5zmOd9eqFHogvH9cA+DUSzMLbEX8ZDQpYA
	3Ezf+Wa64yGLYxHDyxobPYiu9jc2DW5j3xBjY+qSKKPIloOdmPx4uo8mbenX8ZNazWAO/1B1QDB
	4brBYFGZ42ijwpOS0yH8WEZ0UMZUyVEowQqkob3mra0Xg=
X-Gm-Gg: ATEYQzxGF58EhXQFybFgiMq5nHBhh6EWBadwiYTr4QcSbx6wEba8qCl5L6RihT/IaOO
	6KkV+yTeTr+8suVlWJtB4FuLgOSNNw5GVnmaaBCWMxjTt6bRZ/nhu+PRRDgdzBsJeW2g7DnTebu
	xSNW0Q6DxrtQF0q3NVSRzO6q0v1uQta2qokjL9gB0Jqp45ouopong4xRCwxXB1Me/wFBc9afA/T
	6+1qN4=
X-Received: by 2002:a05:6102:801a:b0:602:86a6:9877 with SMTP id ada2fe7eead31-604f9207448mr1318421137.19.1774625720230;
        Fri, 27 Mar 2026 08:35:20 -0700 (PDT)
X-Received: by 2002:a05:6102:801a:b0:602:86a6:9877 with SMTP id
 ada2fe7eead31-604f9207448mr1318394137.19.1774625719840; Fri, 27 Mar 2026
 08:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
In-Reply-To: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 21:05:07 +0530
X-Gm-Features: AQROBzArL55rBfoGm-EJWxEBft_Yhyn14M2tYPDSJIAQWe8jbwmtJIHALjSUpGg
Message-ID: <CAHUvh4kqBYaKQ_ztiYig2iRGwz+7ypk-7mVms14gRpstzmvq_w@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6a3b9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=mIfB1nhJP2LIQaxH3doA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: PZE3oAbN0r2NMTzU7c_IPXIe0I5B9nAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfXwxgdwkyiGzci
 O4MYpNT99J0j3N8MCRhOKX8s01ZWPbCJDWZxWJz8ZqZFkJDkrg0Bd8KLK/Z7S46W41MM0lHfuFT
 DucKQur1g+KlozAdRajHAqu4Y8bbkPxNon5yMEwhcdNn2YqTC8FWJTKZoLshBkZvnEu/2yuhHHO
 JFqp/4VXok7JVqFbWCVuU806QJSn1+3P7p6px13vDgkZIGkklO08NS9cBNMJ91qPkcgwk7u7/Js
 XjQlm4RGTB5d0l5H2f9rpOZ5PQpNRSVe8hDhlmoJ8I6V8NQCOutYByxdhbkW+oRmkyglDFo3v6y
 6Q19K/wXqBpwsUTCrLXU3+FPSW3nmVk+jAS+AaDb2ITYXHShZWz5JxCl6LTGsDVIAY4reSc7t5R
 d4Tt3540coB2Vhhcy6elFu2/uMO7Cn/bh4KcFPySPZB4sYpaXrStPRsKwGzOPdelf5qFjqIbhLR
 zOmIBqZxhB4+fSPs/9Q==
X-Proofpoint-ORIG-GUID: PZE3oAbN0r2NMTzU7c_IPXIe0I5B9nAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100363-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 97943346E44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
>         qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
>         qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
>         qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
> +       qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
>
>         /* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
>         regmap_write(regmap, 0x52224, 0x0);

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

