Return-Path: <linux-arm-msm+bounces-107801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKxEC7z7BmrtqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD654DD61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 971CA30626CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED299466B75;
	Fri, 15 May 2026 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h30i5fyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8one9Yf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9412347AF6B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842095; cv=none; b=IWco2xaKJUlzOysTmypZsJPYlFJCG/p7I+JxXTqbonFYQ136BsldoCET7u2PWXZLxvZhho09y0z4iJgrLlyyuDnl86mjmRyvZJ9zblPLaq3L4q4JTYK+xxGlU0izVTU8MWPX/ASWd6osghfgenT0JhKu2xamM/mrQ//M1lhdYxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842095; c=relaxed/simple;
	bh=79rZTqEAggicoiBdRqg4u5kofmpZCLqTyvAK6+GYcms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RgMzBhdaclu1ryTAm5cOmUnBXpoF9fTjBfPkJWYleTR3i8obkRAxfXkh2Q3qkYFQgFY3mcuNaGdDKHWgdnZdI1VCJOWYiJB8hy6P1LZZ0WAASmorezdI2GCSG+8EA0h3aRxh/vn7Vu2EpLN3vFDSofM5fItkqUKP1ugYmBIgeWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h30i5fyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8one9Yf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5A2ul3796896
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=; b=h30i5fyL9qxNDuoQ
	Yu9oH+wBgaK5cOsI3Nu+6bVQjvrOUabnhDyUWmok1sofyPKAjozZ/Pg6wkqwwgzy
	RwZlFy+K2I3IpbnpRv5bj2yhFwwHfkcKkHXr9kuYvgIZvp8Vgk+AVMlfVdCWoRKb
	ATWQzCJUiVLSUU8uLCxhJ9yFELBQT6LIVhJiC8D3/8vUGME54GIpf7yDChdSMCoM
	yCzqM3qmiDzPlHUK/pETPxTw48zuZxogQ8jQisVRBmAmCXuHPBURsIZRDnXdFxWR
	26mzLvJlNBIwPXGFZOwHLojPckbdVzu5UdJ42b626+asZOC1aAqrms6iBJ8Srzj5
	SBdCLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stuw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso97367455ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842093; x=1779446893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=;
        b=F8one9Yf6QehYOZgoYRWD0GOgBcM9Nt0H8wmFZzzKRZvU0WV2HSrsJsbRVM+tP1jTK
         QvKoBLUG+h3+9wlrJ7aIFosCijOdDu94avPMEErQVV0edTVi3vRjRrojiPl1yXI2hjiC
         N2EWYfmhIGrk/X4KneCJvNadaqT+24lwZTXcQX/SNx/rymLpFil+FBOvZbFZC7SdWmJZ
         3GvoAbqZfbQ2RzQeQYIgJrmMrBl6dl9EBY5S6NZkmr/U88OFV/FYiPRbIKGqU+rgT/kx
         ngBE1nJwyMX+PUolwa3/80JJHQGa8gev3OQ478v74b1E1svUgBtQZhDb3mI5tv9DqHXw
         Be7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842093; x=1779446893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=;
        b=BupkK/cgWuyZz9aTMddIrNlb0LUuA9LWWmLSsAvSRvwZOTmY4UQdVk8i8zwkS+SWcL
         2rEWTDK7GAbDS2B/WUfX5KN0vRyL0zTotH4zYIrHx2kUxjkp4DcVl/cYprJQ/AlZ9ms8
         WYqzHrufCJOVAyMmKgfMHFTQomkve5P/JS3TIXJ7izywRhPQnANrBsMy5sIMtAreOO/N
         RZy/aKheVU3oCStdSuYo7S6/rxR/T+COPSemgAYDRVYcfvAzgFzreKt8fu2TyOgWxjKI
         LJFL9DnzTerNH0ZRvzK3go+jmnYy/bK7GtvZv8MYlhL2xxIhedAh9UJ154xQGyS5fmbM
         fkYA==
X-Gm-Message-State: AOJu0YxFqS0klnjfBB5WqnKiLrf9OzkwfRVt9UCOKc3gqJyAbftsdT4/
	OGWJ8em/JYxyrkRLm3XdnVta8/lcqkSQKZSeJk5UFKl6+CN76ZISWR7RFVksGeBbys96ea3T3Ea
	P9HUxt9k2r/2p0CcqPCyNeV3HS41xgs2CQ+2tHF158jsoOyv2gwjWuGif0uD+aZ360Hq5
X-Gm-Gg: Acq92OHzWNIxBy+qQVYVmxr9x1plmx5bT1xSSOv7HksYyNNcHlhcc0gpWdho7NxEPK8
	fpIdvaRk+Zfchw8zD7feLt9GV7lpklkoPxlbDex+AnICSwt/hWwAFZD2K+zoJWVrOPEkxrKwElu
	R04QJxgJ/8vz6S26fKtKvZz5q4MgMg1jv/012xWz3wagS+0zn1i2m4i5I/WqJjELkyf1zqDoxqX
	wHjmcI6k3iMd6rmwsufN9JuQBw7My9mrLXAOkfNQflRvz9Equ2afGpjECWZQ2yL4Y4OFqG9hu8e
	TaKWputIEhFksoNIHpPw+B0XrnI4aGKRXm+ybaMKUv/DaBybyHNdHnA81zW5XN8qF823USbImFU
	MjeXJP4RnbQ/W8pWV3jJnmhVmT4PriDn3sQ8kl81+GVcTgzV85xnViyIIjP5O1wnHimwEnisnoX
	hFNjT7WT9caec3ifZ6wr1PBVw/JO3japCoKM5TKkSdn6+rlpKao+A=
X-Received: by 2002:a05:6a20:6a24:b0:39c:241:65a3 with SMTP id adf61e73a8af0-3b22e6668b2mr4159406637.1.1778842092756;
        Fri, 15 May 2026 03:48:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a24:b0:39c:241:65a3 with SMTP id adf61e73a8af0-3b22e6668b2mr4159374637.1.1778842092295;
        Fri, 15 May 2026 03:48:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:48:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:46 +0530
Subject: [PATCH 5/5] phy: qcom-qusb2: add QUSB2 support for ipq5210
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-5-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX5FOCkvyZoOzl
 fe2uhL8ex7rxMUlSvShuYUatryCV+2/6Rv9uDT0TD67OnOvyV83BxhApM0kCw9KQSkhNyaYb8UG
 ShOlZtxfUvuaiZ9AEgqrROsdgRVB4gvfx9xC68sCr1v+lDx5mabhzUJWndt/k3UiVY5AkIqbM1c
 o2n+a1i1th6RvW6tHcT1SEadXa9YhvuBmLMpLhWklNXzJnhyZYJ6s5yur28JarOZvSdA7HxotnZ
 S5Aq1Lyx8afdUSUr4WhoKluRfh7q4Z8L2Ge7xiasfCa/ZfNiyPdyAAtfH1BL8p2OITOMP424dgV
 lMX9RYDMDNJO3+v10YsjQP7UjkXMj55lUWnyNY8NYBkw/JVb3nXBguEN22XrnlLmYFiH73+CIYu
 XVMwhj7y/9HzvBzo01FWSuHnclkT4WfjQUm99I9het+LUfe9t2mKSZMqwKqP6QbpSdm+vTd+wLJ
 /mcqzXmmXxgoyR1j1Ww==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06f9ed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YjFiIu3VuMthEzLBwjoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: N901mlC8RJiTaGOVMD1Fvo80DSw30q1g
X-Proofpoint-ORIG-GUID: N901mlC8RJiTaGOVMD1Fvo80DSw30q1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: C2CD654DD61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107801-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the phy init sequence for the Super Speed ports found
on ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..749106175742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -929,6 +929,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
+		.compatible	= "qcom,ipq5210-qusb2-phy",
+		.data		= &ipq6018_phy_cfg,
+	}, {
 		.compatible	= "qcom,ipq5424-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,
 	}, {

-- 
2.34.1


