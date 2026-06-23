Return-Path: <linux-arm-msm+bounces-114129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xT3qOYJOOmrn5gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:14:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 559256B5AB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:14:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FRilvu5V;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Kjp/2PlL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114129-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114129-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E74C30CB8CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4048533D4E4;
	Tue, 23 Jun 2026 09:10:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB130C37A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:10:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205859; cv=none; b=Mj5z76aWtrY0suXa2LcEYWYgnw7kPnYmPDHY+vmQMhTQ0Ng9Lpqo+at1n79VO+D6Rz9cCsGiNmL8oIiwh1lJlmbsYJ+fV1xPzYvpD3EoHhLMlOKd+ESsWHghiYfg/y4vIsRMP2HZU9Ye8L7+3vxrdWk3YaFH0BrMfPY0ELmwlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205859; c=relaxed/simple;
	bh=aZTk6VYs7jIfxVy4nmMk+/sbS5FgVUwI9eml6aT8phI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0+ynyJolPK6LlKGvW5/HvMqYtG36N6KPE2kNjCWmKzpIyueyz2n1gj7kDVGx++ygAs1mfi1AlIIvTjr1Uykr8yjYkfn1g0NF2GGrnhvAiIBcHbSjnKwjq0AECudult8Z2eBrvT5nWHB8hm+rINkBwLyt5NAH0TgYTJay1FUGXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FRilvu5V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kjp/2PlL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cW9V3338321
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EN23gSHJavFg0nQoFxdRyLB3tJifXtU1vjwZh72CHAE=; b=FRilvu5VPvd/6clU
	Te6chqPdBWxlrqe65mvVhPdK7ry3BnfQwVxklEcmA42PhnfQqcZOHWwR4Ktl0M/g
	cWGfOcioO9+hZNFszBSGCXXcrBwrzTnYjveI1ix/flyMnzojDrY6r2Tr0FLJXedx
	6ZIqKBATO+CQNQs6ueCFk1JRcyQWJ5nEQo1REayYHS50iSUVabAuX4Vyi3SyRAK0
	Jl1MTC5j2PSB+oNUei5cUkhlAbQnnA4TgylKwvslavmUp+xJ+dzrArM9ANMSN7Y9
	5kcjVdNtYQCA8cantKsgdIseyleyZjqnev2oqyu5DJ224M/Z831Eczr+TpMNw6of
	kx80uA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhfrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:10:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51968526a68so13799631cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205856; x=1782810656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EN23gSHJavFg0nQoFxdRyLB3tJifXtU1vjwZh72CHAE=;
        b=Kjp/2PlLHL+X8+wFXSUkxN3aClYyoUcSWXO+CsckzyzYm11x5ZDfUihkoEyQZ+RtiM
         eSfG/mAQJVMO1h7BtMI9BwBQjdV+DyBaJxLLWPhr2CqbqLhPV4X/tO616vEKpFR93AaC
         9Gq5r1yXSnowg2SNQ2ereuoWFktN8ET+ScyXgwpXbKzIEHaaYiB7FgpqntIRSeMm5Maq
         wyJQOtXEh0lW1Jm88w3enZsnxsjJ2GADOQmuHiheuaj+AlFmj2z9V90pYOumkwbUt+hb
         Qqju1cEr0wEi/0DLPWQmLCVCsanF1V9bcK3hmMgkad3jlFj6z6gx/YwlS5KWMtgaFfUt
         40Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205856; x=1782810656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN23gSHJavFg0nQoFxdRyLB3tJifXtU1vjwZh72CHAE=;
        b=EWcWW7sD8qx6w80fVJqZMP1GC/eOqa+vWzqRLu6haI9cXY4fZ4Yy/N7LsYwesRIO5L
         pTtrxpTx0mPqEQCZhivvUBKIJLMK9NeyVSJa2cvw/eF/K7fYb1s6Szm7UNG8f7a9rKCp
         b4eZXNSiR3Sw++Auu3BimXQiUEYlkWN+LZ3RX3sZVeugNYn3dKrHAbUfZ0bPUOGyvSfv
         hdLTuJ65T6djWh3mBeCfVOf7TBru2vpJeQw38bEiiP3uemVMLruNnQFR/uW8T/fggqoo
         R/r1Ro6kN0xG9iCQJe1XpIOaXVOqxk9TPT4FvT2lh+d5oWWNGgUxzlzM9SaGrOcDeMo5
         /n2w==
X-Gm-Message-State: AOJu0YwL1CNuCJyuZHR5hPn0tufIUhj/9jxF0x6jjUf+5eYwgYh80DfX
	uhzxy7dYPbZH0ksyDYAbqOCGLPXXA31PSr7S84dy13B3stfL0o9wA369pqHrbp7e5YRMHndKjpN
	rY9/ZIjvQiOpPlH+sIkkusW7GwsnPEDFeEnxcA4PfTrL7QzNNAD3jYjjrUYjxQqzcKHsJ
X-Gm-Gg: AfdE7cnkhmraAFJQ+tNlfChaJqZc3I0WnooSGqdyn0kTxexfh4cyYPt0Gg7h7ss1gfS
	J2O5VS5mAFiSE3nUsUMVB0CSVyFxkbkXgjVcw4HKGO5SXajG3Lg4btbJg1KNjHRX3rWFYUuq01e
	UIgFzM9Ku3ghKQUJ+Rfse9u7dTaCfZ3NF5qjMEKhII4PCiWS9AHM+Bg8wLoiZBDYGo4ePKE4Lhj
	PwKXYiozqRtvcgpibIkkQXbclOOA1uxmds78gVrCNN7P4CjXDaJ042O4okiO5zsY0PBqtBQwh6p
	EPJnr6CDfpBPwxP4tm5g1VnJJYUNse3Z/lkUWs7e6D2D6FCnjLc6CxJlYg78zAU1lo5kbuz+6tQ
	EzbmYQQbUM2P2WgRW0YhbHuOkRkPLHDZ3d8s=
X-Received: by 2002:a05:620a:4693:b0:91c:9d38:30ac with SMTP id af79cd13be357-925c7d073b2mr470751285a.4.1782205855631;
        Tue, 23 Jun 2026 02:10:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:91c:9d38:30ac with SMTP id af79cd13be357-925c7d073b2mr470746985a.4.1782205855007;
        Tue, 23 Jun 2026 02:10:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be31c73sm4510811a12.17.2026.06.23.02.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:10:54 -0700 (PDT)
Message-ID: <fc3d0dfc-20cb-4289-a0dd-67ace50d42d8@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: edp: update v8 power-on programming
 sequence
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
 <20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MyBTYWx0ZWRfX1Ss0tC+xLRY1
 U+Gpu2fOPmgsd0raS9XNPKFWSL6ex1Fhv7YAN+FQKL7JYtFkBzr58CVyGEYT35B9lwkfBuUbYTP
 /4dUMUSiWZKPlUZ0c2Rd7h+cStkA4y7NszIT339F8/LR1TSvYSE2ljzYpUNuZiChY7F1LhCoIZA
 ENS9x+StBrVfq0gu7IhD/UKmq8vrkYj9BdeOMs9D0o+I2c3VNYQ0gaC1uEnbtr7xe/hundMB1L0
 Jsf4xlBBqISMtGJ3yYN6dtMy5aWFZOzJExZPg6l2r8DTuktZOLunUgOuZrRTRLwELuBASzEG6wf
 5lCuP9rXn/FsDW+1mqKHgoVqFQ9ySk+GVEL3blPbMgVgAGy7mABmrfmKDTytXbgyynS79ZNJMPs
 Wi0CYOB0qiN0cTD5JkezQXbXjXuFcuD4T4GAs68aDuggjSVg2TPnhEOpbYdDTVvxD1jhwzOC1SM
 /I38XdptqgWuLeuVnRA==
X-Proofpoint-GUID: uLXqelC-eKvHWoAeJbe251FSvW3V80hu
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a4da0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3ehXmQAtHDlHOuXEyOsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MyBTYWx0ZWRfX4zpxEtta0+7H
 wldg/NIL5NGIalI3pVlBNIPOCR/KNMiulOS3yHI3JWb3CKdbyHl/1peXhOcMLpHQhjJgHday2Z2
 f3FwbEr84cLj6FlpZSK2+Ix+t1n6DlU=
X-Proofpoint-ORIG-GUID: uLXqelC-eKvHWoAeJbe251FSvW3V80hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114129-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 559256B5AB8

On 6/23/26 1:29 AM, Bjorn Andersson wrote:
> While the introduction of the v8 programming sequence brought functional
> eDP support for the 4-lane 8.1Gbps case, it doesn't entirely match the
> documented sequences from the programming guide. Further 5.4Gbps,
> 2.7Gbps and 1.62Gbps, and 2-lane support are both incorrect and
> non-functional.

This largely looks good - I painstakingly compared it to the HPG and got
the following diff, most of which shouldn't matter (ordering of config
writes and duplicates), although there are 1 or 2 things that may actually
matter, please take a look:

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index c5d1fa0ae6cb..6504c52b33b5 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -385,6 +385,7 @@ static int qcom_edp_phy_init(struct phy *phy)
        if (ret)
                return ret;
 
+       // hpg just powers on all the lanes here already
        writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
               DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
               edp->edp + DP_PHY_PD_CTL);
@@ -393,8 +394,8 @@ static int qcom_edp_phy_init(struct phy *phy)
        if (ret)
                return ret;
 
-       writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
-       msleep(20);
+	// not in HPG
+       // writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
+       // msleep(20);
 
        writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
               DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
@@ -404,8 +405,10 @@ static int qcom_edp_phy_init(struct phy *phy)
        if (!edp->is_edp)
                aux_cfg[8] = 0xb7;
 
+       // HPG only turns this on in mainlink sequence
        writel(0xfc, edp->edp + DP_PHY_MODE);
 
+       // there's probably less registers on older platforms
        for (int i = 0; i < DP_AUX_CFG_SIZE; i++)
                writel(aux_cfg[i], edp->edp + DP_PHY_AUX_CFG(i));
 
@@ -516,6 +519,11 @@ static int qcom_edp_set_link_rate_aux_cfg2(const struct qcom_edp *edp)
 
 static void qcom_edp_configure_tx_pre_pll_v8_lane(void __iomem *tx, u32 interface_select)
 {
+       // 3 times in total? I would imagine once should be good
+       writel(0x12, tx + TXn_TX_DRV_LVL);
+       writel(0x12, tx + TXn_TX_DRV_LVL);
+       // auxless_cfg1
+
        writel(0x0f, tx + TXn_CLKBUF_ENABLE);
        writel(0x00, tx + TXn_PRE_EMPH);
        writel(0x00, tx + TXn_VMODE_CTRL1);
@@ -533,8 +541,13 @@ static void qcom_edp_configure_tx_pre_pll_v8_lane(void __iomem *tx, u32 interfac
        writel(0x03, tx + TXn_RESET_TSYNC_EN);
        writel(0x04, tx + TXn_TX_BAND);
        writel(0x00, tx + TXn_SLEW_CNTL);
+       // ldo_config - already done in ldo_config_v8()
        writel(0x60, tx + TXn_RES_CODE_LANE_TX);
        writel(0x60, tx + TXn_RES_CODE_LANE_TX1);
+
+       // if tx1 (&& is_edp? unsure)
+       // writel(0x1f, tx + TXn_RES_CODE_LANE_OFFSET_TX0);
+       // writel(0x1f, tx + TXn_RES_CODE_LANE_OFFSET_TX1);
 }
 
 static void qcom_edp_configure_lanes_after_pll_v8(const struct qcom_edp *edp)
@@ -586,7 +599,7 @@ static int qcom_edp_configure_tx_pre_pll_v8_lanes(const struct qcom_edp *edp)
        return 0;
 }
 
-static int qcom_edp_configure_pcs_v8(const struct qcom_edp *edp)
+static int qcom_edp_configure_auxless_v8(const struct qcom_edp *edp)
 {
        const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
        u32 auxless_setup_cyc;
@@ -618,14 +631,18 @@ static int qcom_edp_configure_pcs_v8(const struct qcom_edp *edp)
                return -EINVAL;
        }
 
-       writel(edp->is_edp ? 0x03 : 0x00, edp->edp + DP_PHY_LDO_CFG);
+       // shouldnt be called here
        writel(0x0f, edp->edp + DP_PHY_CFG_1);
-       writel(0x00, edp->edp + DP_PHY_AUXLESS_CFG1);
+
+       // ???
+       // writel(0x00, edp->edp + DP_PHY_AUXLESS_CFG1);
        writel(auxless_setup_cyc, edp->edp + DP_PHY_AUXLESS_SETUP_CYC);
        writel(auxless_silence_cyc, edp->edp + DP_PHY_AUXLESS_SILENCE_CYC);
        writel(0x08, edp->edp + DP_PHY_LFPS_CYC);
        writel(lfps_period, edp->edp + DP_PHY_LFPS_PERIOD);
-       writel(0x2f, edp->edp + DP_PHY_CFG_1);
+
+       // bit(5) is for built-in selftest only
+       writel(0xf, edp->edp + DP_PHY_CFG_1);
 
        return 0;
 }
@@ -1117,15 +1134,33 @@ static int qcom_edp_ldo_config_v6(const struct qcom_edp *edp)
 static int qcom_edp_ldo_config_v8(const struct qcom_edp *edp)
 {
        const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
-       u32 ldo_config;
+       u32 ldo_lane_config = 0x00;
+       u32 ldo_cfg;
 
-       if (edp->is_edp)
-               ldo_config = 0xd0;
-       else
-               ldo_config = 0x00;
+       if (edp->is_edp) {
+               switch (dp_opts->link_rate) {
+               case 8100:
+               case 5400:
+                       ldo_lane_config = 0x91;
+                       break;
+               case 2700:
+               case 1620:
+                       ldo_lane_config = 0x51;
+                       break;
+               default:
+                       WARN_ON(1);
+               }
 
-       writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
-       writel(dp_opts->lanes > 2 ? ldo_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+               ldo_cfg = 0x03;
+       } else {
+               ldo_lane_config = 0x00;
+               ldo_cfg = 0x00;
+       }
+
+       writel(ldo_lane_config, edp->tx0 + TXn_LDO_CONFIG);
+       writel(dp_opts->lanes > 2 ? ldo_lane_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+
+       writel(ldo_cfg, edp->edp + DP_PHY_LDO_CFG);
 
        return 0;
 }
@@ -1184,6 +1219,8 @@ static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
 
        writel(0x01, edp->pll + DP_QSERDES_V8_COM_SSC_EN_CENTER);
        writel(0x00, edp->pll + DP_QSERDES_V8_COM_SSC_ADJ_PER1);
+
+       // these should be set later
        writel(0x6b, edp->pll + DP_QSERDES_V8_COM_SSC_PER1);
        writel(0x02, edp->pll + DP_QSERDES_V8_COM_SSC_PER2);
        writel(step1, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0);
@@ -1296,28 +1333,41 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
        writel(0x36, edp->pll + DP_QSERDES_V8_COM_PLL_CCTRL_MODE0);
        writel(0x16, edp->pll + DP_QSERDES_V8_COM_PLL_RCTRL_MODE0);
        writel(0x06, edp->pll + DP_QSERDES_V8_COM_CP_CTRL_MODE0);
+       // hsclk_sel_1 (duplicate)
+       // (ssc_step_size1_mode0)
+       // (ssc_step_size2_mode0)
+       // cp_ctrl_mode0 (duplicate)
+       // rctrl_mode0 (duplicate)
+       // cctrl_mode0 (duplicate)
+       writel(coreclk_div_mode0, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
+       writel(lock_cmp1_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP1_MODE0);
+       writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
        writel(dec_start_mode0, edp->pll + DP_QSERDES_V8_COM_DEC_START_MODE0);
        writel(0x00, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0);
        writel(div_frac_start2_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0);
        writel(div_frac_start3_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0);
-       writel(cmn_config_1, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
        writel(0x3f, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0);
        writel(0x00, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0);
-       writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
-       writel(lock_cmp1_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP1_MODE0);
-       writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
-
-       writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
-       writel(coreclk_div_mode0, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
-       writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
-       writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
-       writel(core_clk_en, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
        writel(vco_tune1_mode0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE1_MODE0);
        writel(vco_tune2_mode0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE2_MODE0);
-
+       writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
+       // ssc_en_center
+       // ssc_per1
+       // ssc_per2
+       // clk_enable1 (duplicate)
+       // sysclk_en_sel (duplicate)
+       writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
+       // clk_select (duplicate)
+       writel(core_clk_en, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
+       writel(cmn_config_1, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
+       // clk_fwd_config_1 (already set in phy_init)
+       writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
        writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
        writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
 
+       // already enabled in phy_init()
+       // writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
+
        return 0;
 }
 
@@ -1540,11 +1590,7 @@ static int qcom_edp_configure_rate_pcs_v8(const struct qcom_edp *edp,
        if (ret)
                return ret;
 
-       ret = qcom_edp_set_link_rate_aux_cfg2(edp);
-       if (ret)
-               return ret;
-
-       return qcom_edp_configure_pcs_v8(edp);
+       return qcom_edp_set_link_rate_aux_cfg2(edp);
 }
 
 static int qcom_edp_start_pll(const struct qcom_edp *edp)
@@ -1609,6 +1655,8 @@ static int qcom_edp_phy_power_on(struct phy *phy)
        if (ret)
                return ret;
 
+       // bias_en_clkbuflr enabled here in mainlink sequence
+
        ret = edp->cfg->ver_ops->com_ldo_config(edp);
        if (ret)
                return ret;
@@ -1616,6 +1664,17 @@ static int qcom_edp_phy_power_on(struct phy *phy)
        writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
        writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
 
+       // should be called here
+       // writel(0x0f, edp->edp + DP_PHY_CFG_1);
+
+       ret = qcom_edp_configure_auxless_v8(edp);
+       if (ret)
+               return ret;
+
+       //>com_power_on()
+
+       // cmn_config_1
+
        if (edp->dp_opts.ssc) {
                ret = qcom_edp_configure_ssc(edp);
                if (ret)


