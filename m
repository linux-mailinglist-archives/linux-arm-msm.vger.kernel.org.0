Return-Path: <linux-arm-msm+bounces-112235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bcewDjE+KGqFAwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:24:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14966251A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:24:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UXsEzaC8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HPfDqVSF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112235-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112235-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC8A4303C932
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7143B0AF5;
	Tue,  9 Jun 2026 16:16:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA93AEF47
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:16:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021775; cv=none; b=FObWhCy2rP+Qkp50FZ6RHp2vzNUhhdAqgHSI7VV112tPtXBgwm7NtwHkAhzwmw6TKUC3D5Zefn8AZQES3wPmNNeowxa9lq4umLDJs0BdGGQZ8i4vFFHLvrkGCq0k3ZLN1yjYabL5Ry70X32XHRXBJDKv1xurtJ83ko7kY7CR8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021775; c=relaxed/simple;
	bh=RGZw86xGkdUpL3Yb3T4goj9j44/FR5hnDp6dHhD6r/M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O7WHhXEPF4X4nIVjU+Ci6dP9UBilSLX346cVoAkW3jfMgIiZ2jRxKSIW2mG9Wsh02bQ8w5MX0vf1j4SGhkXoHmwoFz4ro2IDtNitiOIXLFMxD7toP+jDM8p249p4yztY/mNRt0bZABxOgS6q4SZT4yFaZ0iLs6xPDRcupGX6yzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXsEzaC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPfDqVSF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClVI02286852
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 16:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=baAlscezeWep/7nTC3TEVF
	q4ab8yBQklw99jUOpIZ5o=; b=UXsEzaC8Mqmm9WqjwXC3RHOHCdxGnK/CBHxqZe
	unl1zhiRGnqTd09IfS1nYmCrw3zsHapulLUsRkR89Dw2yh8tuWli3deFTnbR/kLb
	UaZZ1Oy0FMZgv2AVIo3vmjKRf0+hVXDOoUiP//ilBc+TexFxto9CykmVmDUK8C6j
	8fJXT9LmNaEWMjrxKKxiLIqCaXdTZv4sOqYm5HYOtKUUzXrSMSpGbj+P5MF9YMp5
	hoJF885zgy/GrD8Ql0F/iSHBCZ3e98UtG74+lnkoMpBJccJQpOE+Utj6ES/U6WER
	VFhd+raY4WI74kLQm0cJdXOppVn2TL+kidHe/bVOdQcIGuEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jt1tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 16:16:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97415004so11066607a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781021773; x=1781626573; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=baAlscezeWep/7nTC3TEVFq4ab8yBQklw99jUOpIZ5o=;
        b=HPfDqVSFgP93BNm3alehwmV1A9nobyqvEzUvr+DgL2UUQb/EnwS/ehHMHMGbwhonnT
         fEmqXT07BHlNJ/aOAEsMuLeO4WhGM9nTZmFxIcRVvF/2BgxgcX1PDXLCxrWFg5MgrVS0
         Ga3171OaMy9omBG55EQbJofzIZfbEQ6N8qjIT1ZtliXrxyH5P2tGIj6DKkCY8wMeVmJ4
         e19Qp+BKsle8mG2tCoczxVZgN6KXU33bEnJuTr0eNWAd4N0Pw5SLwxUWyn8c98QOjymj
         UOHMxpj3NMytNWqQKaHtAhvR0D3Vhiy1RoWgbiEatONYjJ49EDYLg39fcVfdT6XrULn3
         JqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021773; x=1781626573;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baAlscezeWep/7nTC3TEVFq4ab8yBQklw99jUOpIZ5o=;
        b=jrA6rjxMPKVssYxIs/SNc+8OIpbfW/8RxpY7XrzxVn+UQxg7s0o/ssO7vcd8Gqaph0
         5Sg4xl4I32s+EGt2AiW8aJmGYWca+Yxh+VWU2oVQK7CHCpL3Jhm1fc430NMabiFXP1P1
         ELrg8UL51rKnCNXsJaQY9EgLa7FA0fcXa+0PMngD8gwHX3j99YOaktIxo/MzEmY8SYJk
         YtJFvrYf8in7DaBSuQMUwDHdCsFS6yJ4jk8nzPLga1nXlv1reIfhSq02PL27b5xD8hud
         5YHztxbmDFkmWu4j5E78clIpEgShbWblgxWnxG6Wqb162mK66KoaqjbpC6cOnn/DTMsl
         B7Mw==
X-Gm-Message-State: AOJu0Yx/ftl+G6CR0FEHw/Y4nWZez08NJHfRcga9FctMlRG0EyPVsAH5
	lWjHwrohnTDwT57worTLv0YvWxgkspOCGC4casdq+G1NAMu7Q4l0QfYeU7MAhUUP4Y9wHU9v8po
	zL4ZaCU/xYApVUqRjR2mcjXbNeTOcHhm451IgwTxsrk6lh/95RzWa/6sO69OUALSN3uE8
X-Gm-Gg: Acq92OFAiG9VEcAEaN6Zspx74MWTmdD0lmRrb9SUqyznlhHgjv0UPgCOr1BqLzQyzyu
	xA8cjb4cOLhhCFcyHpPNePnuqOmBUhGka62a5Nkq872iZpHJFzcFQaz660DRuAnxrMDnZ5j1BE5
	z9SCegjKcxjkx4GQ9IrhY7fdFi7y4ydLJHpHGvfSkoYeXARRX0l+th8OeEbtVOpY8VKm8GxXQmf
	3MqPyA3/bOXoxlUOpp1Rx4/6lw6sVeQ28EJDpBVqlt/9mjNhN1YEUbhR/ZSbcGnmfd5xHX6HhsL
	JIW7yBLuI8OGR5+CiAmNEuDMO7Jx8oM+1uIy0mVljlZAyKItcmbEJpz5hGfo0uQY+VvMxPEy4W6
	lio+wyYqAVITXZ8Nx/hJ1RwW43ACRlgJnk8s7EGgLPe9WxR0p67cBUYOZ43CeC9nRenI=
X-Received: by 2002:a17:90b:2742:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-370eeb1bec5mr23158606a91.1.1781021772494;
        Tue, 09 Jun 2026 09:16:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2742:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-370eeb1bec5mr23158553a91.1.1781021771847;
        Tue, 09 Jun 2026 09:16:11 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm20391897a91.15.2026.06.09.09.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:16:11 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH 0/3] media: qcom: Add support for the iris codec on shikra
Date: Tue, 09 Jun 2026 21:45:39 +0530
Message-Id: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACw8KGoC/y2O2QrCMBBFf6Xk2chkadMUEf9DRNJpokG7mLFFE
 P/duLxcOAP3zH0y8il6Yk3xZMkvkeI4ZBCrguHZDSfPY5eZSZAVVGA5neMlueMyzbwttRQIShp
 AlgtT8iE+vrL94cfJ3+bsvP+OrHXkOY59H+9N4WpjlNGqxOCE0sFih1jZqnUKajCl7UBjMPKj7
 j2R+45pis1/i/5v4V2kCZGfpjnnojnwWoIOAqRVQuxGovVtdtfP33WOLTu8Xm+e8UBI+QAAAA=
 =
X-Change-ID: 20260609-shikra_vpu-b5421c03270c
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781021767; l=17892;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=RGZw86xGkdUpL3Yb3T4goj9j44/FR5hnDp6dHhD6r/M=;
 b=GHgtqa6SI3gcLIIv3SeNUbJImx25oStMydOzrZz4NtYv14Du+3Mqw+F9FfxOul/Zf6K7wRv9d
 CbO33lU3m0IChvk/xOtRUUwjwl2AKU1B2LvbkBolOiOp8jONbUc51RI
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: n2PrqueSh-XzduN8kJA-rhhiQO4OPq61
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a283c4d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7s1ES9sKXb6EmgU4USgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NCBTYWx0ZWRfX72lw1+7G/Cxm
 uRA9caey5JR1IomDynRtaxtj3FZbCWmnRjBLMpEPATXCJXCIFw3vxlUVhkjwOyAhwo/dLE/oOQt
 /HTAFyg/uTXe1DqBWm3BS18n5h02qJ20Gc3SfoRU7EvP5Thi75oqNQ4+6c2SLx/saj60LtW3FBq
 hN14nJ2cjsn50zmTcVoJVXgQhwaPhlpgtFbrOdhRirqP1sNA/rAtyBCD2A6sYS0FEPJzEndxAW6
 29cP60wOrOoqlQX/UuRGR3bJVn/yqHHDk1oKh9b7ZzLqNEgPigVTpnxaNyfSwZGEUvIjjBCN1Mo
 xA/h3n/ND2TFRwvs1ir+oq3xS1nevIjCrvwFZUm6PpRFxt9XXrgZddHpral/FbQz5vEJeiZC+Ke
 Sq3v/fwOQEjHXk6LBcGESrICoHiQfUavo5o09YbvuG94NADPm3/pxInc6IAfC45AUmWlPVEUqJO
 JHWgp7zDmGn2iwGnBxw==
X-Proofpoint-ORIG-GUID: n2PrqueSh-XzduN8kJA-rhhiQO4OPq61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112235-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA14966251A

The shikra platform uses AR50_LITE IP core as video en/decoder codec 
block (the same as agatti platform). Extend iris driver to support this
platform. This has been tested on the Qualcomm shikra boards, shikra-cqm-evk,
shikra-cqs-evk and shikra-iqs-evk boards with HFI Gen2 firmware.

v4l2-compliance results:

v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 41 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

v4l2-compliance -d /dev/video0 -s5 
--stream-from=./data/resource/simple_AVC_720p_10fps_90frames.264

v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

Fluster results for HFI Gen2 firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
        - BA3_SVA_C
- Interlaced content is not supported yet.
        - CABREF3_Sand_D
        - CAFI1_SVA_C
        - CAMA1_Sony_C
        - CAMA1_TOSHIBA_B
        - CAMA3_Sand_E
        - CAMACI3_Sony_C
        - CAMANL1_TOSHIBA_B
        - CAMANL2_TOSHIBA_B
        - CAMANL3_Sand_E
        - CAMASL3_Sony_B
        - CAMP_MOT_MBAFF_L30
        - CAMP_MOT_MBAFF_L31
        - CANLMA2_Sony_C
        - CANLMA3_Sony_C
        - CAPA1_TOSHIBA_B
        - CAPAMA3_Sand_F
        - CVCANLMA2_Sony_C
        - CVFI1_SVA_C
        - CVFI1_Sony_D
        - CVFI2_SVA_C
        - CVFI2_Sony_H
        - CVMA1_Sony_D
        - CVMA1_TOSHIBA_B
        - CVMANL1_TOSHIBA_B
        - CVMANL2_TOSHIBA_B
        - CVMAPAQP3_Sony_E
        - CVMAQP2_Sony_G
        - CVMAQP3_Sony_D
        - CVMP_MOT_FLD_L30_B
        - CVMP_MOT_FRM_L31
        - CVNLFI1_Sony_C
        - CVNLFI2_Sony_H
        - CVPA1_TOSHIBA_B
        - FI1_Sony_E
        - MR6_BT_B
        - MR7_BT_B
        - MR8_BT_B
        - MR9_BT_B
        - Sharp_MP_Field_1_B
        - Sharp_MP_Field_2_B
        - Sharp_MP_Field_3_B
        - Sharp_MP_PAFF_1r2
        - Sharp_MP_PAFF_2r
        - cabac_mot_fld0_full
        - cabac_mot_mbaff0_full
        - cabac_mot_picaff0_full
        - cama1_vtc_c
        - cama2_vtc_b
        - cama3_vtc_b
        - cavlc_mot_fld0_full_B
        - cavlc_mot_mbaff0_full_B
        - cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not 
supported by hardware).
        - FM1_BT_B
        - FM1_FT_E
        - FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
        - SP1_BT_A
        - sp2_bt_b

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 
113/147
The failing test case:
- Unsupported level
        - AMP_D_Hisilicon_3
        - AMP_E_Hisilicon_3
        - AMP_F_Hisilicon_3
        - DELTAQP_A_BRCM_4
        - IPRED_A_docomo_2
        - IPRED_C_Mitsubishi_3
        - LS_A_Orange_2
        - LS_B_Orange_4
        - PPS_A_qualcomm_7
        - RAP_B_Bossen_2
        - RPS_F_docomo_2
        - SAO_G_Canon_3
        - SDH_A_Orange_4
- 10bit content - not supported in this generation of video IP
        - DBLK_A_MAIN10_VIXS_4
        - INITQP_B_Main10_Sony_1
        - TSUNEQBD_A_MAIN10_Technicolor_2
        -  WPP_A_ericsson_MAIN10_2
        -  WPP_B_ericsson_MAIN10_2
        - WPP_C_ericsson_MAIN10_2
        - WPP_D_ericsson_MAIN10_2
        - WPP_E_ericsson_MAIN10_2
        - WPP_F_ericsson_MAIN10_2
        - WP_A_MAIN10_Toshiba_3
        - WP_MAIN10_B_Toshiba_3
- Unsupported resolution
        - AMP_A_Samsung_7
        - AMP_B_Samsung_7
        - PICSIZE_A_Bossen_1
        - PICSIZE_B_Bossen_1
        - PICSIZE_C_Bossen_1
        - PICSIZE_D_Bossen_1
        - TUSIZE_A_Samsung_1
        - WPP_D_ericsson_MAIN_2
- CRC mismatch
        - RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
        - VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 206/305
The failing test case:
- Unsupported resolution
        - vp90-2-02-size-08x08.webm
        - vp90-2-02-size-08x10.webm
        - vp90-2-02-size-08x16.webm
        - vp90-2-02-size-08x18.webm
        - vp90-2-02-size-08x32.webm
        - vp90-2-02-size-08x34.webm
        - vp90-2-02-size-08x64.webm
        - vp90-2-02-size-08x66.webm
        - vp90-2-02-size-10x08.webm
        - vp90-2-02-size-10x10.webm
        - vp90-2-02-size-10x16.webm
        - vp90-2-02-size-10x18.webm
        - vp90-2-02-size-10x32.webm
        - vp90-2-02-size-10x34.webm
        - vp90-2-02-size-10x64.webm
        - vp90-2-02-size-10x66.webm
        - vp90-2-02-size-16x08.webm
        - vp90-2-02-size-16x10.webm
        - vp90-2-02-size-16x16.webm
        - vp90-2-02-size-16x18.webm
        - vp90-2-02-size-16x32.webm
        - vp90-2-02-size-16x34.webm
        - vp90-2-02-size-16x64.webm
        - vp90-2-02-size-16x66.webm
        - vp90-2-02-size-18x08.webm
        - vp90-2-02-size-18x10.webm
        - vp90-2-02-size-18x16.webm
        - vp90-2-02-size-18x18.webm
        - vp90-2-02-size-18x32.webm
        - vp90-2-02-size-18x34.webm
        - vp90-2-02-size-18x64.webm
        - vp90-2-02-size-18x66.webm
        - vp90-2-02-size-32x08.webm
        - vp90-2-02-size-32x10.webm
        - vp90-2-02-size-32x16.webm
        - vp90-2-02-size-32x18.webm
        - vp90-2-02-size-32x32.webm
        - vp90-2-02-size-32x34.webm
        - vp90-2-02-size-32x64.webm
        - vp90-2-02-size-32x66.webm
        - vp90-2-02-size-34x08.webm
        - vp90-2-02-size-34x10.webm
        - vp90-2-02-size-34x16.webm
        - vp90-2-02-size-34x18.webm
        - vp90-2-02-size-34x32.webm
        - vp90-2-02-size-34x34.webm
        - vp90-2-02-size-34x64.webm
        - vp90-2-02-size-34x66.webm
        - vp90-2-02-size-64x08.webm
        - vp90-2-02-size-64x10.webm
        - vp90-2-02-size-64x16.webm
        - vp90-2-02-size-64x18.webm
        - vp90-2-02-size-64x32.webm
        - vp90-2-02-size-64x34.webm
        - vp90-2-02-size-64x64.webm
        - vp90-2-02-size-64x66.webm
        - vp90-2-02-size-66x08.webm
        - vp90-2-02-size-66x10.webm
        - vp90-2-02-size-66x16.webm
        - vp90-2-02-size-66x18.webm
        - vp90-2-02-size-66x32.webm
        - vp90-2-02-size-66x34.webm
        - vp90-2-02-size-66x64.webm
        - vp90-2-02-size-66x66.webm
        - vp90-2-08-tile_1x8.webm
        - vp90-2-08-tile_1x8_frame_parallel.webm
        - vp90-2-14-resize-10frames-fp-tiles-1-2-4-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-1-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-2-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-4-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-1.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-2.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-4.webm
        - vp90-2-14-resize-fp-tiles-1-16.webm
        - vp90-2-14-resize-fp-tiles-1-2-4-8-16.webm
        - vp90-2-14-resize-fp-tiles-1-8.webm
        - vp90-2-14-resize-fp-tiles-16-1.webm
        - vp90-2-14-resize-fp-tiles-16-2.webm
        - vp90-2-14-resize-fp-tiles-16-4.webm
        - vp90-2-14-resize-fp-tiles-16-8-4-2-1.webm
        - vp90-2-14-resize-fp-tiles-16-8.webm
        - vp90-2-14-resize-fp-tiles-2-16.webm
        - vp90-2-14-resize-fp-tiles-2-8.webm
        - vp90-2-14-resize-fp-tiles-4-16.webm
        - vp90-2-14-resize-fp-tiles-4-8.webm
        - vp90-2-14-resize-fp-tiles-8-1.webm
        - vp90-2-14-resize-fp-tiles-8-16.webm
        - vp90-2-14-resize-fp-tiles-8-2.webm
        - vp90-2-14-resize-fp-tiles-8-4.webm
- Unsupported format
        - vp91-2-04-yuv422.webm
        - vp91-2-04-yuv444.webm
- CRC mismatch
        - vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
        - vp90-2-18-resize.ivf
        - vp90-2-21-resize_inter_320x180_5_1-2.webm
        - vp90-2-21-resize_inter_320x180_7_1-2.webm
        - vp90-2-21-resize_inter_320x240_5_1-2.webm
        - p90-2-21-resize_inter_320x240_7_1-2.webm
- Unsupported stream
        - vp90-2-16-intra-only.webm

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Vikash Garodia (3):
      dt-bindings: media: qcom,qcm2290-venus: document shikra Iris compatible
      arm64: dts: qcom: shikra: Add Iris video codec node
      arm64: dts: qcom: shikra-evk: Enable Iris core

 .../bindings/media/qcom,qcm2290-venus.yaml         | 20 +++++--
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |  6 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 61 ++++++++++++++++++++++
 3 files changed, 83 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-shikra_vpu-b5421c03270c
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-patch-id: 67fa5f31ee5109470da23db3b513721580f4c86f
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: 8a8a9df61f7c7c51d7ea9cdacc52b7bdd917f12c
prerequisite-patch-id: 5b89b41d7c729c23b3b1fff9b5f572f4baa915ca
prerequisite-patch-id: acd08e91e5e2c6f4799879e48481b07167c0a400
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: dd62ebff6be6a2e2d32743812d35ec54daf91d00
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: a3026c858ffdfd3bfafc837e72c67fffe46021eb

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


