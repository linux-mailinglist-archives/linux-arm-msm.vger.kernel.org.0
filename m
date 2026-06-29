Return-Path: <linux-arm-msm+bounces-115182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6kEPMMuKQmrd9QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:10:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDBE6DC7A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:10:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H6uAJrPm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CJI5zNOM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115182-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115182-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A22BA301563C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0649B41C303;
	Mon, 29 Jun 2026 14:48:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC13537FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744538; cv=none; b=J1uK72IdQoaZxT2h1BTIKv+kxOoi7P553mbUH/G8KqYPACIqKyLb7OknIkh9rOLPTn5AEHlmjmRTLnenRLSpqNpj8F0bpTFd5tBJHWlZ0GyG/h9tD7w6/vbuy5eJ/ZmClCF6750KZnCOoEP4Ll+MIfomEfBmPI3SGHicAnj3TlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744538; c=relaxed/simple;
	bh=TY/Ycd0Pv0UYVXHobfUENPm0aoX/GRTId1HfFoGzN1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXpldPlnj4bsaLoDxDvSsImzuAeXf9hC3LIRd9B0yIUNtkHKscwEetV5JfO9O67QMheNFNFpVfYm0QSQgZ3f3qijzyl0FI5pkl+QOYHWw+Gb4nABeeMlo3Y1MQKqXQzDAEPkblgK58/QJMUybJ1sAw25Cmce3zPY1bAMNNt/TUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6uAJrPm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJI5zNOM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASu1F2640822
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=; b=H6uAJrPmvSmWcB34
	usS88T/Q0eKB2k3PInmaPfU+i976qDNDwSNegVEB/60KEP5HjppOioy6UcEkSYhb
	f+/FvJAmwJILDWyIo4ZnkAAT9SaFqV4um6CB8Gmccpbh169rzoVUKy/9OFZTVR0P
	uDBzEsbvQuFwrt5bW0ccq7TCCIuj6uFyDS26wKop6NhSZzIB/b0sfi8xPeZkj7Ya
	MTZDsq7ZH+Ml+w84VwNKdB3CcmLbwnPJeBLmTaG4qX3RSMSbxlkkPxuZCvFuIoXZ
	Y9TkuMtsO1YV7rO+OVTN8aexMO0hfC0kj35n6g4lWbeSY+YeaeSaaFUsDaGG/ikR
	4xFdlQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1hur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92229624a71so643592085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744535; x=1783349335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=;
        b=CJI5zNOMpIBlH1HHIpjTtHevDLDR4xaDUJSu1lVRaz870OhP4n7l+G6sksV1kEOXPi
         OUPLphQ11zp8B2Sb/orVFjDV/IhnRufuTX6aKZaPnyoACXgdTQU/35HSMWklehwSvUOW
         sf+ICffEfguyxg6m3ybVFw/sabJ5+zIHQIa3aYHB0iCAWa+H6TgPeGnLRU3oEAtvJHjd
         tnzgXRal5HiWWwosrFqACfM7tmxdiQieNYM1+YMmMhtf5cC9qE7K7/C9j+w5SE2xugJh
         eHmOzdRQj8Mp4rQufT9FVOn+ZldwlOzuqtvW7y1jCWXERqNSL4/tto6onw7dShbocOXn
         A1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744535; x=1783349335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=;
        b=l0hN2Byk7PzCD1pxyGo7tLEzsnt3T7Yz0joREFR8h7TkA6jIy/+qQAbNxc11hznu/5
         dznZ5rpm6ErdO5gPhDK4XRYufgj8It7Ts1CX8nJRNJQA5t69cNQjgOlcV0DRUbIid33C
         MQ0IVPv2+AhS94evG4/kKj1E1im/VRTh08cNV/HT1lD9NF7YC065AaVtZqOSLyrhhhSr
         KWYG5qosKLuNO4BCYwYKEoUKv9aE/xHg2wZsjlDB2pbfxTziT17gg951aiqEpuXNcH6x
         bD1xoDbc8FZ/UV4bCiMoB6NeTJ29mr7Ml+g4wF04m1suPv7+HJl6oF7KKN01WjXuZWpU
         WY1g==
X-Forwarded-Encrypted: i=1; AFNElJ/S84wy0boG9iY9HJ5Kjsu5sNwFubO/ADanGhHhCcDJ/VbglPGJGqa/9/Bg+72Z6GpQb05yj+QuWmdNbSJy@vger.kernel.org
X-Gm-Message-State: AOJu0YxCx343FaslH/3NG5TrhzJQ3cJ9Zmb2Nw3Ftn5ZTrSTEgrKpsp4
	Rh/V1FSMXsyH+AsL+T1vF1VZh9uNiK9LlHwwewAbuXJlyn/2of6BDoNZJgGOJ+TxAVODDyS1D47
	IMDyGjCXG0sunLxaXNOeEK3tFgPAHB3FXYVag9DVKwvqt6v5N5b5tZnddhQMskYdrjOFP
X-Gm-Gg: AfdE7cmcbmeHSfx0zs8+bS1xDax3EdXY2E0Tv3qDlv289wzcqfd2bP9oeFoWQWBBiXf
	mE/rpBTSBXbuadWRlFwpMlJC1n+a0P8H6WLsjRcCEQBSCYSjmSuShafYN1Rxr/wizm9Ie0BRIx/
	IPnAFd8nIyXsyD7EfdVOKTI9gBR+ftemIUqE1H6ZLARbm6SNdI5XaA5C73LwqtoODFGfPcjBQD6
	oUlu8nrRKFohX5uRFsp8MUdp2o0N9Uo4lpADiyT78/uM914DgbnsyEZSxGmR1VzGuiniS2XvtSz
	b8WtN0HgAVS7S6Xywdvloa8qRHruPn9rZVuThlrSXuJ1Fk3Az1524v7fZ4YAiU13kFIAVCsOLOt
	yxYtndBSBr9ZxiTeZ1BheHmKxx6rPLYVrVo6X9DKyIiKnfrbNtsHlWh/mzcdhY7+KRcUyO8pbyQ
	==
X-Received: by 2002:a05:620a:454b:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e5a5c673bmr275402185a.73.1782744535337;
        Mon, 29 Jun 2026 07:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e5a5c673bmr275397685a.73.1782744534816;
        Mon, 29 Jun 2026 07:48:54 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:06 +0800
Subject: [PATCH 4/5] drm/msm/dp: report IRQ_HPD as an IRQ-only notification
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=3483;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=TY/Ycd0Pv0UYVXHobfUENPm0aoX/GRTId1HfFoGzN1Y=;
 b=AweWrHKC11A5BUtjWFtmRQjNIxUkW7uePMZ5PMNnbD77GSRS7TqPFahMkouslMZ1c+wEOjpym
 c2STxLMOEvRCcfMVC2RaEefZcMBHE71VDmHjWjqIJ+WHqFr7aOTLrQH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX2kwethMT5eah
 tf62Pse0JWxhm4Z4kjv6tm0zcqIe5HlkdDp54fpFKAaSdnF/mKIqevt6JImLSuBHO4R3zvqzIay
 26KvSKQvUQDOzFjQh8oDMXQPP16cNtk=
X-Proofpoint-ORIG-GUID: Y_zwcwvTW-cHkq7DbH8rYlDlpqZ0JyG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXxkYGmAmwb+V5
 upXXK0R8I/wGRbD/z2Prb0ow0B+ZSR8Era3paD0JdPOHGHCtWBloyfkUEEL1yvXzxgTqqwl/oGl
 9Fwx2V/a4/9JgXGHFMprNsjiycXwaea3iP9kkOPvLQyHomXR2TpbN0e3JJqDNEjW0Tzq1N5417R
 joDECmBwxNEEkU3ylVN5zzpvi+ZINV7rahEIQ2Lj9mY4r4geKbWhkyvh0K1kkiE7E0/7Ax/QlmW
 Av5dNAKQUIVFzwzZC77qEwAS9ESz0E0WSUt95Cy1G9Vw1Dm1B9VehIz49H5rBeqr136WrHlrXYw
 Ei+Sl/9jf9JJZyUgRww8jsnwhHDlQ3WM2IzlrIzY7a8HeTkv6h6i7j7oX5XPtvG6D+muMNeIG54
 CBewaJd3+TxqrN6Irt2DR/MAwnl/ScOo1bjJvFFymTwbC0iJf1QZmg1gl2RxVT2ut3ny9SFtzBU
 dzq+WCoy1L4sYd8QzMw==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4285d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MqOh_s_JX8DWAqdrIDMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Y_zwcwvTW-cHkq7DbH8rYlDlpqZ0JyG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115182-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:yongxing.mou@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFDBE6DC7A5

MST reuses the SST connector bridge to propagate HPD IRQ events through
the bridge chain.

For IRQ_HPD notifications there is no connector state transition to
report. Use connector_status_unknown together with
DRM_CONNECTOR_DP_IRQ_HPD so that the bridge connector framework treats
them as IRQ-only notifications and forwards them without modifying
connector state.

The DP driver handles IRQ_HPD events based on
DRM_CONNECTOR_DP_IRQ_HPD rather than connector status transitions.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c   | 22 +++++++++-------------
 drivers/soc/qcom/pmic_glink_altmode.c | 14 +++++++++-----
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc93b566fbca..4ee391cc7165 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1119,14 +1119,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-		if (dp->msm_dp_display.mst_active)
-			msm_dp_irq_hpd_handle(dp);
-		else
-			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-					      connector_status_connected);
-	}
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
+					    connector_status_unknown,
+					    DRM_CONNECTOR_DP_IRQ_HPD);
 
 	ret = IRQ_HANDLED;
 
@@ -1781,11 +1777,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
-	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
-		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
-			msm_dp_irq_hpd_handle(dp);
-		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD ||
+	    hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
+		msm_dp_irq_hpd_handle(dp);
+	} else if (status == connector_status_connected) {
+		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
 		} else {
diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 946eb20b8f83..28ab8cbb5ef9 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,11 +373,15 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
-						conn_status,
-						alt_port->hpd_irq ?
-						DRM_CONNECTOR_DP_IRQ_HPD :
-						DRM_CONNECTOR_NO_EXTRA_STATUS);
+		if (alt_port->hpd_irq) {
+			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+							connector_status_unknown,
+							DRM_CONNECTOR_DP_IRQ_HPD);
+		} else {
+			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+							conn_status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
+		}
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.43.0


