Return-Path: <linux-arm-msm+bounces-112417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ByYoGANKKWo7TwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:26:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D08668C79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:26:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HSb+EQi3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HbycfI4D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112417-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112417-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C7FC312C687
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338983E2ABC;
	Wed, 10 Jun 2026 11:16:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA03E0C6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090182; cv=none; b=hahH180uqdEedaC8aFM+etYXveO1tM9303OfG0Ctq6vE13l/wP7lAzVQOVR/+rvIZ77YcjPQ39/LusVcOjOBCtRLWdNBuxHMvMaqgRs3rIzKe77+YDOLFHdZXhIITIduE3ngMSssENFu0drqfFBvmcmWnEOBVvhmX52t/0NzctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090182; c=relaxed/simple;
	bh=9kgbvc6lcRsjm2rYEdHKSpGv/RdVkEndKHAn/vA5sL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TWBo76O9tqozcORAqafR6M4fx7W2Q0eSB3wTAzBed5EL0JmP2/TzAUFTj82ADGe0KEqTjM8YrA2vuAD15S6dP/Vadx1ivbIlNjTm8XupOZnmK+mjtf4ImqerTGSLhSwTCTjBmkhE0biUVfZ/AQrY84pV2Fn3Z6cLocYvwcpNYbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSb+EQi3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbycfI4D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A8woPO735554
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xhxhdwj8YyS0a4IFacW3Lw
	/dnqYjdyg0qnIaNczzEQ8=; b=HSb+EQi3FiKLxwj+qj5U835L9CuqQ9KQMN4uJZ
	4rBO8G5FxkFTsvYeSciKvye1f7LU71PXE7CPDR2IRe5mFNM9/QP6O6E1lRoCLtg/
	CFVwDnewCaV1SoVu0ptMuiYRrAh4fq36y75KTpuijfs7YTpgGXzDc63fpE+gvhCh
	avgULg0luch1n24XYhhEiqxraeuOqqXQ1HEfCzTj3NZvUUt4oxCAALmJU81KfFNJ
	ZRRAA5enMFnyI7R2PRTtwZOW9J8Tr+JhPwt4B1fD8oURWXD/l1UfmK4HAMO6bADe
	HHQTptR8yKkd7i/FJUdGc5w8awkkGSs26mIBOs6N1TLGGOAg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1rhrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:16 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso2848912241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090176; x=1781694976; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhxhdwj8YyS0a4IFacW3Lw/dnqYjdyg0qnIaNczzEQ8=;
        b=HbycfI4DG6BZYdUNpj9Cpu8ZK0WzjQwtEfpYWR9IcIaUm/JIxMf2w2OlZL2YY1ac9V
         ccRVhQEi90zNGXZRsqkfIuS87EebKmkNxpeUTZSAnGJGYqLGs1mauSDmjGY3n9mkYdsz
         LOQRNSmBIGVhq2aGJd3waAY+A7S0qlnhDpWGn2V/YgtDcy7DNxV3R+xF/yX1LWT8nsmL
         utAN7TiILcA2bL1TAGnd28HffvN5m/0w2u5DOC/f4drLA57S5jz2g5PTK3XVSRXnLO/X
         lzBKwmCDdBTUeLzbBAUrVynEykm7WL3GyQZGlauXCc3SIVa3eU+sPFwEWOWOsRtmfFoX
         nwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090176; x=1781694976;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhxhdwj8YyS0a4IFacW3Lw/dnqYjdyg0qnIaNczzEQ8=;
        b=Jvh+48HK7YPY4YsFbdbn7QZ8cc9FMefRBw3EVMWPuAkUF1Nhxmtyt37KQnHSXn+8jv
         pdNP6GNU1w3hfWer6pUEUBYTgGLvM/sdSUW6ewOsD2xF7U9T6DYch6xQ3Gz1heslLdBE
         1E6OAA7jSaaJZWSphJRmlnSdUaNAB+CzlMer/hBaHSJEnLH7kDFXHaTSSdXq97FEBX8w
         WXfLAAwfxeYNBSuWgPC/iQp13GfQ6EOYFCZHRbiKHfQfVm0kLt1r2XybatKq/PtmailZ
         SzTUwLnc/AcVO69gyLBcX8aVMSrxlt0lrH/d/tLqzaO1ClfZuTSJiMUgEZLzB/zTfmCn
         JijA==
X-Forwarded-Encrypted: i=1; AFNElJ9MVkDta3qA3aIWfBh+gCEZTIk73yNcyfVs0QmHaJSku3eWhC7RzIVKWWRnaanvPUa5nb1hHJ65PZY7fZx+@vger.kernel.org
X-Gm-Message-State: AOJu0YyHqk826Pjp7C3kzLv0Xg/s2yEJ2JQqZaVuiSNzgTTR7Pga9TrQ
	bq9XvTKJNDcIMoDm/tlR2KE13ZG96qDEmX6OZXBrZYbvjdRvX0fKuCVixFqMqlbmnNAlR2jZtr0
	pXad/Z+OHsT7q6gBuOI/T0u1U0c4IAFdQfZNXxeWJK1y6a8Kf9O50kmRMP8AHLOmuf85mZMuKm9
	uv
X-Gm-Gg: Acq92OHsZ/DDLgy7A4PjurKOceoh+2w3Ds4S0GE+9uv7bYK2mqhW//jlh8v+aw0+paW
	pO0n17K1u39ZgAf9SSs5evKQilx63i98IIuO/vDwLz2fkIvnEBr4TZyoRtL6TsalxTEwEeZPauS
	WqjmUUEHAAXH+Db7r1ufXYVdhFobQKXnZHFTwAmSJxsADL8NaDYmnM/+om/U9y1ZLCglGknn/5B
	nBg2bXsz6c2MLkrm4ieji//f1QKhwdMrMUpkOKi+2WKCe2LghCmZjoY9EsSg5A4CJonkwPwMgcv
	2Op/PFEd+LpNMBxmcNN0du2C7G6s6bbaqKiIndKM9UHuODv+AN2OuI+e4AgSQ9EJB2qMUk01rHw
	zO1Hc4jVVKCgisbWTkeTsnf5f3nN2KXiaTnSE
X-Received: by 2002:a05:6102:549f:b0:6d3:aad5:6d17 with SMTP id ada2fe7eead31-6fefb0a00b5mr11687515137.19.1781090175612;
        Wed, 10 Jun 2026 04:16:15 -0700 (PDT)
X-Received: by 2002:a05:6102:549f:b0:6d3:aad5:6d17 with SMTP id ada2fe7eead31-6fefb0a00b5mr11687470137.19.1781090174800;
        Wed, 10 Jun 2026 04:16:14 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm71817460f8f.33.2026.06.10.04.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:16:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:16:04 +0300
Subject: [PATCH] ASoC: qcom: x1e80100: Allow userspace WSA RX channel map
 override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHNHKWoC/yWNSw7CMAwFr1J5jSUnqBVwFcQiJC4E5VNiApWq3
 p0UFm8xizezgHDxLHDqFij89uJzaqB2Hdi7STdG7xqDJj3QQEeUXJPDp80RZ8UHUkRoQsgfrDb
 i9kkcMJoJ9Z70qF3ft0HzTYVHP/9a58ufpV4fbF9bANb1Cy9PR4aNAAAA
X-Change-ID: 20260609-sound-qcom-x1e80100-allow-ucm-channel-map-2302f2d552d5
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7485;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=9kgbvc6lcRsjm2rYEdHKSpGv/RdVkEndKHAn/vA5sL4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqKUd37hdKPjq59ttTwtj5HetMnPOPuznpCceuJ
 /sVaINx/iCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCailHdwAKCRAbX0TJAJUV
 VhEID/95t5L9DQOlVTsmyJKYyF47f/FlJ8u4Imw/BdCgAhNasEUNPl4bgU02qjAh0qL6Wg6HVPQ
 uIrE6M1vTbK82DZpFziAmfCVPkY22Fl/dv8U2qQibiAMFDUFwWtbNC3yPL3bCREwGu++MF0ztT1
 HUa8CkGIIQYh63AeIFovOzAQ4LkqB+KqvvL0IMIidQqX+nmefDpKeJJn+rYF3nw06CFxd8L5OLH
 MHoIDBMsSpv7bPOlaCFXYzAH6KhmyqR2m253ZuTJ6u0gPd+Z0gPJm5kgD9yUoHfKo8QVNT6xEY0
 VDHdnhyRpsATXFwXTJ9ROk2PHxKJgk2VNs0TGUeQUEpSqKkK6HvsTM/lkr7KlOP3Q20pm6uqdn0
 8yBn4LDxAZGqi2gH3O8oktmSWIwCeQ3vgUEanygtMoaL1czfx102cAEZBUHUS5j7pRN08602jHN
 krbLhp+Zc0JLFmKR3A2lbK1RL2D1YquwhM3EDq9juaWloarDKQMzHLJJN9BOYCh0ah2wFhnnJee
 3OnbEp1+c1jAbbMOEwpv/h4JqgIeN+nHGB1p7KYeZnjKLSNt5tRvX30SCr3amFVGRHGtUhOCZC0
 l1rcE/UNXXhuJtZjCmhyk5bLvGnWxRHXud3HVr+HTg1oj7Xe8PX5uiLEBTgZ3p4uCV5bAY/AkLV
 aL42ISJp4wwm3Ug==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: sgwj8VulJj3VZSreEsjo60c-LU-7GSKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX+VyLh81ZgZlO
 Q4Sz5YuyZxtKsxtcL2/qNoSeu2it5XjrRVMfs/2NzalKwTxl1Kc96xd6i+cyaP+vH7ACb9DE1BH
 O8j9dJndjW9Xph4sruIqBK8TSAySx5j84snUggn7oit2ViNIuXSX7D+1bkdV7ukKImH2EERkfm6
 pt6aox9bWHaAcaWCxRioaEX0BCFC1sFhZgqdEagA86zz3GsTgq45jdIxvllGMPYNBua9ZOGma+D
 kwQ+X90zp7+dZ/nBGcoCQMyilkv6dzcJGVoiQnZ/AZVd48QvdE5DK8JxOA2oypo/SZb5fS8GPuT
 8Ay4UlB7TduBvsF6Qv8yPqoUIWSFS0/3v4k2OTXc0G4CysNtAmnqiGTkXZjTZr8zgh9CNYa+9rs
 oD/8tFSZaa/zfXX58L9uckuPX/L8gtQv/yRVixtC59reF+vg2aAkknLC8JgKd5404+QJsfJ8I6h
 1qRKd9HiWlimJkFu+VQ==
X-Proofpoint-GUID: sgwj8VulJj3VZSreEsjo60c-LU-7GSKL
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a294780 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YPny3dLhwSbw-aUf-wkA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112417-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:neil.armstrong@linaro.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2D08668C79

The WSA RX slot mapping is currently computed entirely from the channel
count in .prepare() and pushed unconditionally via
snd_soc_dai_set_channel_map(). Userspace has no way to express a different
channel map, so any map defined in UCM is ignored.

Add a writable "Playback Channel Map" control on the WSA RX PCM via
snd_pcm_add_chmap_ctls() and make it writable. The map selected by
userspace (SNDRV_CHMAP_*) is stored per AFE port and, at .prepare()
time, translated into the q6 PCM_CHANNEL_* slots and programmed into the
DSP.

When userspace has not provided a full map, the previous default
mapping is used, so existing behaviour is preserved.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 152 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace88..63cd00620ade 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -15,14 +15,105 @@
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
 
+#define X1E80100_WSA_MAX_CHANNELS	4
+
 struct x1e80100_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
+	unsigned int user_chmap[AFE_PORT_MAX][4];
+	bool chmap_added[AFE_PORT_MAX];
 };
 
+static const struct snd_pcm_chmap_elem x1e80100_wsa_chmaps[] = {
+	{ .channels = 1, .map = { SNDRV_CHMAP_FC } },
+	{ .channels = 2, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
+	{ .channels = 3, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+				  SNDRV_CHMAP_FC } },
+	{ .channels = 4, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+				  SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
+	{ }
+};
+
+static int x1e80100_chmap_to_q6(unsigned int pos)
+{
+	switch (pos) {
+	case SNDRV_CHMAP_FL:	return PCM_CHANNEL_FL;
+	case SNDRV_CHMAP_FR:	return PCM_CHANNEL_FR;
+	case SNDRV_CHMAP_MONO:
+	case SNDRV_CHMAP_FC:	return PCM_CHANNEL_FC;
+	case SNDRV_CHMAP_RL:	return PCM_CHANNEL_LB;
+	case SNDRV_CHMAP_RR:	return PCM_CHANNEL_RB;
+	case SNDRV_CHMAP_SL:	return PCM_CHANNEL_LS;
+	case SNDRV_CHMAP_SR:	return PCM_CHANNEL_RS;
+	case SNDRV_CHMAP_LFE:	return PCM_CHANNEL_LFE;
+	case SNDRV_CHMAP_RC:	return PCM_CHANNEL_CS;
+	default:		return -EINVAL;
+	}
+}
+
+static int x1e80100_chmap_ctl_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	unsigned int *map = data->user_chmap[cpu_dai->id];
+	int i;
+
+	for (i = 0; i < info->max_channels; i++)
+		ucontrol->value.integer.value[i] = map[i];
+
+	return 0;
+}
+
+static int x1e80100_chmap_ctl_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	unsigned int *map = data->user_chmap[cpu_dai->id];
+	int i;
+
+	for (i = 0; i < info->max_channels; i++) {
+		unsigned int pos = ucontrol->value.integer.value[i];
+
+		/* Validate every requested non-unset position up front. */
+		if (pos && x1e80100_chmap_to_q6(pos) < 0)
+			return -EINVAL;
+
+		map[i] = pos;
+	}
+
+	return 0;
+}
+
+static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_pcm_chmap *info;
+	unsigned int i;
+	int ret;
+
+	ret = snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
+				     x1e80100_wsa_chmaps,
+				     X1E80100_WSA_MAX_CHANNELS, 0, &info);
+	if (ret < 0)
+		return ret;
+
+	/* Make the query-only chmap control writable from userspace. */
+	for (i = 0; i < info->kctl->count; i++)
+		info->kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
+	info->kctl->get = x1e80100_chmap_ctl_get;
+	info->kctl->put = x1e80100_chmap_ctl_put;
+
+	return 0;
+}
+
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -34,6 +125,9 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+		if (!rtd->pcm)
+			return 0;
+
 		/*
 		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
 		 * to reduce the risk of speaker damage until we have active
@@ -92,6 +186,7 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+/* Default WSA RX slot mapping when userspace has not provided a channel map. */
 static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 {
 	switch (num) {
@@ -120,6 +215,58 @@ static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 	return 0;
 }
 
+static int x1e80100_snd_build_rx_slot(struct x1e80100_snd_data *data,
+				      unsigned int dai_id, unsigned int channels,
+				      unsigned int *rx_slot)
+{
+	unsigned int *user = data->user_chmap[dai_id];
+	unsigned int i, set = 0;
+
+	for (i = 0; i < channels && i < ARRAY_SIZE(data->user_chmap[0]); i++)
+		if (user[i])
+			set++;
+
+	if (set != channels)
+		return x1e80100_snd_hw_map_channels(rx_slot, channels);
+
+	for (i = 0; i < channels; i++) {
+		int q6 = x1e80100_chmap_to_q6(user[i]);
+
+		if (q6 < 0)
+			return q6;
+		rx_slot[i] = q6;
+	}
+
+	return 0;
+}
+
+static int x1e80100_snd_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = qcom_snd_sdw_startup(substream);
+	if (ret)
+		return ret;
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		if (!data->chmap_added[cpu_dai->id]) {
+			ret = x1e80100_add_wsa_chmap_ctls(rtd);
+			if (ret)
+				return ret;
+
+			data->chmap_added[cpu_dai->id] = true;
+		}
+		break;
+	}
+
+	return 0;
+}
+
 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -132,7 +279,8 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
-		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
+		ret = x1e80100_snd_build_rx_slot(data, cpu_dai->id, channels,
+						 rx_slot);
 		if (ret)
 			return ret;
 
@@ -158,7 +306,7 @@ static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
 }
 
 static const struct snd_soc_ops x1e80100_be_ops = {
-	.startup = qcom_snd_sdw_startup,
+	.startup = x1e80100_snd_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
 	.hw_free = x1e80100_snd_hw_free,
 	.prepare = x1e80100_snd_prepare,

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-sound-qcom-x1e80100-allow-ucm-channel-map-2302f2d552d5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


