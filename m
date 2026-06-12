Return-Path: <linux-arm-msm+bounces-112938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q6BhBzAJLGpGKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:27:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45679679CB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:27:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nrzk1bMa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GuWfXPXf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112938-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112938-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 780EC32B6071
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBAC3EDE79;
	Fri, 12 Jun 2026 13:21:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601333F54A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270473; cv=none; b=Kg3gXFogApH+C/Rrl/T1hPwbAsoizSkqMKM0fhwmeLpFP4YhByyUUmlSVdc5ndXCoOpNuqt4vlXXzvRYJVlUm8l+eKr/fLV9ev3mJZfEhivPRjS40hXm3TcJuTGwFkKSE+aeISZVZnxhiBZU9khM3WWzF5a2iZbnJEkyBPECmew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270473; c=relaxed/simple;
	bh=GWTkfYePYPEGTpO3+RiqLPCaGCSmezUWdnppwKHAMqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZhfLPqXjHeE6TKCLjuPEQTEr57zl+KvG4xTlrGvO8mc4bgzMvigGnPRA0lCp3vhg9IY8B6Kx10EpPhxKmNHc1cf+o6pfe6Ka/KMMEkEAFXgkOJg/BA4WhM3LGdrQSGYOyTF5o/B1CuWQNFynFYilnPcYx0Wel4tKbmH/R1VYUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrzk1bMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuWfXPXf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj8vu3760585
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=nrzk1bMa0A1H8jjP
	R71lHkiApB3IbtsXXD6BWzg4CBdLkhL2ePAs7944vvFj5cjExAWYRUYA59Bh9NlH
	HyyX3XclHJv52sf0k3NAq8dcC42z1lryIT0xNC++cxmPXdKkjbONft7WN2nhWvam
	4z4OJ0WJUh6IgkRRjqHYUy7cm6bwBE1Wb2iCNd2foaUMzSCTHOt4iVWF2XcUEBG6
	NeF1Zc4+BPoZwM4xD2ILoSrgowEuGgpOx9u9bTI0/qTalm/g6VivBEV/cmUZeiUD
	79ygZwqnZ0Jf0NNJageQqMlD27bss2GOzAf+PHic7+O7VubQV0emhlu92FPFKCea
	h5oHzA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uu2hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7002d6c3426so1173622137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270469; x=1781875269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=GuWfXPXfs0NqiSLbxS+I+rRjaWT9lwLu59rhQbyERKtJGToL28RYY0KKz9coQt1ZQY
         fLyf4sK9UMs7Rz7yjUMTxCbZi0cXR/txSpVRBQKOHtSr2lQMv02JNNgEJJ94ED6mJFYW
         OOH+L6WU+jOM2mJc0akSNVPY5cplsYWTSOusBeZoEaCGeu7bqmIne6F60uJ8pyRBwEUI
         JP1ZwK3sFsQeD7yLDp4ZgtLBm50diOy7L8F//kjGz62Yr0uvz8AhSRum1PwG/m+VvQiJ
         mvIoyRn1mXVGq4LR3CLQXf1UWHNhJdUDV/vjp1JR/h5/DYZabPPaH7loOQuqsiLfqnk7
         OaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270469; x=1781875269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=eJE7WmO+ERCR6EV6qq+NSOZHVotwreAEwb7ChJSz/4UyXlVwqXS1kTL8Hv0ltk4t5X
         nygbGmeBV6PoVZ09p/F/UCJrJWiWBLc/IwaNLXXNWPUB2iRmX5ZUQsF7wpwhQhy5GikX
         SkC0kf3TPa/t0fHPUm1+QHgYuYQ3GsiFWJKPvaKRvm5A5Pezu7SDpF56y7NqjJ1+TRQt
         ZaiAKRcw8pYGjdpVowPkv3FpDaRrQCSSL/dMkNDlYDeYjRMI9+lZ+n1IST4k/V1qGK7t
         6EVALfVCsnXQb8tMVTvBH2bLvmxUwR63ZyxeUeU53qmim6J33j48Uk+8xoOiCDgj+KTt
         BZ3A==
X-Forwarded-Encrypted: i=1; AFNElJ9BWStF6LnV3eG86OssyBsnLiaxRzYl2jyTZ7eX4N3D3gR3PSSugXtujj1qB8riw0IDAx339ncDhDOR7q4x@vger.kernel.org
X-Gm-Message-State: AOJu0YxgOON+40HQbVlNQFhJydrqvJ+H1XQuJIokRQljAshhfN5EF8Db
	ewUnJSXqjGa0q9IRJhD7+5o16jgKIDQ6PRwKWdE3Wa8CTyqrkYG99W5M/PciFieJjrcRM1jmT+n
	yKd3IpdcuB2/lQAk0vugtp0/2jh1ZKlq0p70M2n6BC/tkusnX1agzTIVCP875RJtqka3I
X-Gm-Gg: Acq92OEd3xkZY3WdiSUZmbQ/Bp3XrZU2/Y+9oHGN988Q7gi8yVlYLuHNjpG8GLhNh0h
	HMzhbE1AqGWozZOCYBXBZ34TDwVeAER2bNBg9xfMeizW+RKUE2+OqWDtr0Rke+RmXwMBbPFjJie
	NHQBLy8LHsVSAJ1tWx9Kp8xFTCZ767ahBOSWLbuR0V23Fsh5NhzXzAhXtPs8WjHfDOkYn8NdZrx
	qhXb7olOHmAERqtvDPyAmuc4Z8eR+LZ7Lj33DwONDuF6hGxcxUb9c96maqDhhs0eSnvOfjitq7S
	NdQRvCEBbT3sMm8EmHCEDFYHgkpUFTkJqR27mmwIwPBjS86rO4rYg+n7B9olfPJAfsidGViwyda
	pMdBC8hNgzFFrfm/OlVh7d53220DiRdd5+bA1tdA9ChWjV2Tv903v7rImKHn/u6hLtp33Yt1QVS
	tAQF63Lq9EIitg4jISXIRFKwGxCu3puYnaz/SruU5hDRE/IPvybjjNo1uTz1iLpKDuikUu5x7n
X-Received: by 2002:a05:6102:5087:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-71e88aeb96cmr1414575137.4.1781270468729;
        Fri, 12 Jun 2026 06:21:08 -0700 (PDT)
X-Received: by 2002:a05:6102:5087:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-71e88aeb96cmr1414519137.4.1781270468317;
        Fri, 12 Jun 2026 06:21:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:55 +0200
Subject: [PATCH v5 3/9] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-3-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX7jAA0P/UKo2u
 46Z/Fp1yT9yu/vZrCs4uUSHIn+dEwiXL4MzxwhhaBJ8hDXLDw6vznMDsESFKZP0TPvXT5I3jZnL
 yEk/FU7BelBRbHDI6bQRZyTOcGK7I60=
X-Proofpoint-GUID: GHwLXSBuGBODwRTegmycrJbKWQAfA8HY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX02uynnfP0dVu
 Uik0G+bO0ok10q8xqUDJkRtx8ee+v8gJBKxQuTvq6TIIUrvDAEra1T2e5wMlf8pzeUH8M8eteoN
 F67b1TlOxB5dgS3ps85oUhcjQX5lu8WHoHAwWVysmmkf9ZVrD1zTvjosLieHLEoAJYbxemIs+MD
 Bzcsdiu0W7xY9+gH6f+HUQjAQBoTnbrWU2253tBXTlSezOF3YaUZP+VWHlVRAbxMn8R6RckWeyM
 6qCICkJG1Bys0nCDoCMcOJu40Y6YpNGdsHNCk4lvAzk5bN6rRpfL7I+2GDfvEHc/s4/Jgl/FPtt
 eTuhoOMxGKi828w0WS7EhgySN0zailZU5sYVaelvJpE2f1bwTM4gz1T2VAYvawX0sJ91qM0K2n6
 12/grsvvTW+9jgZKb7XkVd7VKTE4U/sfil3PLjP2rCK6mrjqS79QzH97Q6DYhN/2nn6UKsDa8wj
 zS4N8oQsWYSxW0PxVSg==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c07c5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: GHwLXSBuGBODwRTegmycrJbKWQAfA8HY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112938-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@
 gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45679679CB5

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Since such data may also originate from chipset OTP or be supplied
via other device tree structures. All of these cells are optional
and can be provided independently, in any combination.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..878c5d833a9cb073520c256c1b72d0f1489e7f4a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description:
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


