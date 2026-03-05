Return-Path: <linux-arm-msm+bounces-95650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOyDD+aWqWnYAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:44:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E074213BD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9477730CF71F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2791382386;
	Thu,  5 Mar 2026 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWRslusU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgBWLKlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A461A5B5AB
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721054; cv=none; b=LgP86Oc+9t14BFVTbukPKmflDQs6TanHArZQkqbaDJ370kxWpxOy5ED4fErwVLGnt82wQ5gChVfwCDOqJ3ufQHulnCE5ay5AsV1BhUcrc3n8y52nJ7mfrUIeLNOUmtrtJgS51hQamxKg4cIKDWyWrdmFo3SnzRU5oSyjWd3qDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721054; c=relaxed/simple;
	bh=YhfWJdZj/hIogxiuGjXK64lA75GeJFzrz73j6/EHDzg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bxSXRVcjt8gKpnqBO7cK6s9NyhaM/xdxsY1+57qfgwPX4Z64HobOVI1O7bHSKbXcWdc01oTgmZFm+9tdWMrI0RKMzW3Rw/Nusb+kBa6BLJaS8/Elgno3TjltDJGQqtCMiFUTR2miQxsfBllqV3HUzUiQwM8fTJjjnazqsqOrD5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWRslusU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgBWLKlz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AUE3E169093
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VUV0y0FIELlN8NyP40NGtW
	8n58Eg5T0qXaEnE+GkIgU=; b=CWRslusUJxHqdLMlhVVj8q4AHop9N4kprrtLRa
	ZvTbmZPMOW9gewsHQaKktS0/AZlzvGcVWp/3s9gbM73mME5M/uo9wq1CuCEPjnaQ
	G9fAHbw0Uuj9t/dvEBP3/Rw9jDHYqBK8KbtWrlFNQLp+BQC/Ln7GxSEgtsUdlrkB
	GAieS1pQZZuxNuyf0IC4hTfyCVZsOZSdlRpAx5VYrHAE1+NW67/kP2xZErcM428V
	HpszU11eOIQyxvyZLJuRuNNuBVd/AJWpNXAnB9FfumOn9l4a94hX4gkVXR0kG61p
	Qy+C0xAbsrRmCA4/8zU2jjzOsXvDwDJJoZh7Qy3anxg+NHMA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84w8p5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:30:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56afd606ff0so156258e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721052; x=1773325852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUV0y0FIELlN8NyP40NGtW8n58Eg5T0qXaEnE+GkIgU=;
        b=JgBWLKlzrt7k48c3m+o3IFhg/nzSyowV3kM+PiVaTCPsJcQ5tjXBkMq7kTDVQ61gd7
         fn50DZ9Za50/O73XWqg5QXtO+mhrTrVwL+xCZFhzfw8n6gkuQSOwf8Rn6zv03cAWaLJH
         3PmGfhxrRgXMEjp2IEqKjT1Y1QTVLWcH+1RkASMyPNGoJtHOUOwigM3EjXLxDYR6RpFy
         pe3COmhMQ5CLxYVslKuSuCHn+F5/yhoKKE2iMk74WK/aavl2u9h5s8H8oM+KxwakBrRx
         OqARGUX9XMnA/QoG2H5FVWPpZ8aiK4Azh9sdX7qCKKEQo+SqXAd3RE5iKnll35doEZgG
         hwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721052; x=1773325852;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUV0y0FIELlN8NyP40NGtW8n58Eg5T0qXaEnE+GkIgU=;
        b=uhEdK7DAqQjaGfOfDyleDro2oPTLi3jcnQRWBC5jst43tivKhue/aCl5G6OIYPCDeT
         yZNGqBdpuT3b2Uv5cFHF/SktoakqhAvk76Rm7kTr6iVGT+3LNAeBTlrtuckW7lhWAauL
         X4otqwRl/mWcKnt9uODoOrUnVPxGdjl/ByzPZFLRexMRNRr8eTqnehYAhIPQ0LQ/gIt2
         BVKD9S/v49k9LVXOXXU3ILCTEiIaW9njyhEmU0+DqZWr82ILUIzAYCDGCMIyES5Zs0yq
         TVfGRZ/lvYT2kXIKqqvZk6SGXdkR1UuuZvv+Sq0si4Op34iKUllGihGhmOogYJlohfQs
         YyoQ==
X-Gm-Message-State: AOJu0YyFox6b0JEOPeDMu8844qggx/Hp/8mRRSFcKivY8zPGdsVbywLj
	Rxv575MssHu99nOK8+MQaX+376YIB8hUDYv1bS9E0EDTjtTV6pvau7Y0AM8Nj1NwjC12VS54OIP
	obDmpSibnTkc4SHQ70ID4cfczA089eOHbi5YS6ksKit7VPQ87fvAdkGOUTaREbC/nDQmqMc8Acp
	DE
X-Gm-Gg: ATEYQzyP+d66Rv1aH/EVfhzes1exP8S/lUURhQLiNb1zpMWQTKh2XOemDEBKch85E3q
	B6KjKd6atKt1A9AyrBaqjy+QjpmEK/wIQluAwQt2HLxZeY4PDwRO04OGkJsSvcQpngFTkPgEYbs
	r89SIyZEf2DRvYGvcb3V/PqmwEYgNQHYpfYj/6pDhgo/5SXOlT32xALTWhUKo0IRkO6i24ENmkl
	dTJRmiBpaXrw7BW/R6T0snmcamm3rL9+ltSSaA+6oE03A0MqZPpas4UH0V5mzozWUXD40vWsU/D
	5PE4eGjCwo1PQnSRzs4uzpunY3qdrqxwvQ3l2ecxotSt07Domgjc6jdZl0x1vkTzOkJXMRSXQxE
	1jmn1CxxDHvkh4jzhxb97XT4rSyNmFtC3/bzEAcah/RfJrQP2Dlw3QbP6VXEbHMPuicdVOaz6Xk
	z9w1fY+XpoOKbV/zViZyABXKwY83p3VOy9KQI=
X-Received: by 2002:a05:6122:a01c:b0:56a:e7e7:7d53 with SMTP id 71dfb90a1353d-56ae7e77e9bmr2143579e0c.12.1772721051609;
        Thu, 05 Mar 2026 06:30:51 -0800 (PST)
X-Received: by 2002:a05:6122:a01c:b0:56a:e7e7:7d53 with SMTP id 71dfb90a1353d-56ae7e77e9bmr2143558e0c.12.1772721051092;
        Thu, 05 Mar 2026 06:30:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:30:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/9] drm/msm/dp: Drop the HPD state machine
Date: Thu, 05 Mar 2026 16:30:42 +0200
Message-Id: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKTqWkC/3XMwQ6CMAwG4FcxOzuytRsQT76H8TBGkSUqyJRoC
 O9uwRgj0UuTv3/7DSJSFyiKzWoQHfUhhubMwaxXwtfufCAZSs4CFFhlAWXdlrKjyvlr08nMENj
 C2hSUE/zSchPuM7fbc65D5LPHrPd62r6gTOtvqNdSSURfOJ8DVmi2TYzJ5eaOvjmdEh5i8nr4G
 LnKFwawkVWGNGVGO4d/DHwbqdLaLgxkQ+UEFRa+BFI/jHEcn4tsscA3AQAA
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3202;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YhfWJdZj/hIogxiuGjXK64lA75GeJFzrz73j6/EHDzg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYrlMLSSkrANKkuod+bIQSbKqgHdp/3zY88
 mBF5hWcY62JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1VgQB/sH0AdR/Ys3NCSv7iPKk4aDaJKW9ui3lcL6Yn9N/Edp+MOSdbEOYHKQEjGdsxEOjAjXr3B
 Nzs9q4lw7cmJiD7a1W+howCW+u8BB7ZdnFWcIUhrzcfDGgRsdIrHgNEHDAJ9iE+/sH3JcP9/xX0
 TIazkoQXuOV5Sz/6GFr4aIN4SawOcB9isOgBLpPyIWWsUV8QvSuVHOtenBd959c5rggrzCPpsu7
 mm6eh0529oyLv0yh/q3aSkzQUL9/bbZ0/feq2Ytf8wySMQvNczg/V6eoTIrllrjCWGRqY2/AIMh
 GzLSOdP2xBpXge0IB2Soo2AH4lHdVAEgsLI4WvYlionDZz6M
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: mspqi3_GAYYluMB4r78AuD56wG8QiCjU
X-Proofpoint-GUID: mspqi3_GAYYluMB4r78AuD56wG8QiCjU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX4W2SRQTTzA4x
 j+HX4A+iHpvU1ktEsg64K9esN83cFfp+RO76eQmaNz6G5BQWiAoSXCjzWj2ft8zkV6NE8QLDvlr
 5929O33aA5GmeoUUy3xe7VLbeCenyGmzTG/fYeLKPZH8Q8D+0DAJ0TItaPk1i0Ob2GiAvJ7Md3R
 O/RieVN+eZC3EO/eDIMVYiuxXfcVosgQ8RJvm1IVjjaxRk+U3yugXl8gRhwVxizJ4ETlLejJ7Me
 Xi03JKPMUarhEEN7VpX2lRI4cEz0BINgT8yzNHd/lO0kJYBqsgs8ev6f9g9iU707ijZW/SS4EAJ
 XFs0MPEja+qofvFxs7DSBKrtr95b3CaR1qwBBjCJso1bfX5WayL4CmAJPzFEo+Idkot1ypsRZ2c
 UA4AxneTE05pSu69Zy9Gvl3uXWWEV0afpc0Evh3JbyFm9cz7AAVeRp0j7fE9LWBFnnmsSvqzlkW
 Kf+v20c2Q6WR9b0Lo1w==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69a9939c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Bp5APB5_ZGd9cemfosMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: 9E074213BD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95650-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).
- Remove event queue and move internal HPD handling to hpd_notify()

Note: eDP is mostly untested. This will be sorted out before the next
iteration, but it will not affect the series in a major way.

Note 2: there is an issue with the DP connectors using GPIO for HPD
(rather than using the nativate DP HPD pin), the DP will not detect a
display if it is plugged in before the board is booted. This is not an
issue of this series and it will be handled by a separate series to be
posted today or tomorrow.

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Changes in v4:
- Fixed PM runtime handling
- Fixed several cases where the HPD machine would loose its state
- Fixed the case where detection was ignoring the plugging in display.
- Link to v3: https://lore.kernel.org/r/20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com

Changes in v3:
- Take over the series (thanks, Jessica, for the previous work!)
- Major rework of the series, squashed the set of patches touching the
  HPD states and handling, it is easier to do it this way rather than
  pulling the strings one by one.
- Link to v2: https://lore.kernel.org/r/20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com

Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      drm/msm/dp: drop event data
      drm/msm/dp: turn link_ready into plugged

Jessica Zhang (7):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: rework HPD handling
      drm/msm/dp: Add sink_count to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 712 ++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  63 +---
 drivers/gpu/drm/msm/dp/dp_drm.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   4 +-
 7 files changed, 236 insertions(+), 571 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
-- 
With best wishes
Dmitry


