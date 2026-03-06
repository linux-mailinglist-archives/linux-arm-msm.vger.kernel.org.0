Return-Path: <linux-arm-msm+bounces-95729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFgmJVGUqmkkUAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:46:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC95921D4CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A2DF305C2BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9541C379974;
	Fri,  6 Mar 2026 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GITss9s5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qt7Amnea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349F378D7E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786682; cv=none; b=hFp7/dcS/hx9t+92kXKyX5XO+mnnVL8J4Lh9MNHIZZ7zgxg4X1XUeJ2sxhnKpb5LefbtQomN29g+wi2G1kkSz03q/Dpbi7vlIyvwvsIVtMHC/MhTvNQ+fXPBNgQKpxClJxH7iNHY0cvuHxfGFkBx/L87Cno7teFhYi8qVihNjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786682; c=relaxed/simple;
	bh=1aiBYfB9S6PFMP/nObYnov2Ynh6O0dt/uvkVr+ApD1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e3wi8LYMgw5OKtj2qXUmBCh33yvccaKbP5yPJSyJUuqZ3Eb+icFnUZkc9HFiiJFbe1BR+6kPyORAX5bOVTcj0CGKT5aA/st1CEvxzxWXPufYOuQ8KhEJ2f2C0DJeR0mp5wNqI5luIav7E1TS1ikc/P02o3QMtRXVIoT7MH8W1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GITss9s5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qt7Amnea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aOov3297966
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 08:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SxV8JoRC/1zVKuUhv8Jl72
	Dho1b8qSP2ka6EgvBWudM=; b=GITss9s5YIlcOkLTVVn42lqtQy/xJeq5gSR1ty
	QoeRQyjxxnzq2sw9B7f+MZaQLLXSwZ3BKofZCaXR4MRkq2PM2VC8yJaA3/dBMOvm
	h/MSGNq9910c6Fuu4jXoUasnUprYbqNQjha56mFFaZg3Da2L6zNxVB2+y7qZnJ+e
	h6opMPWbRUyD2hrOawnFNznhNAk2b0yBJsixT1o0kQdJd9/aMAky8WnEH5AdFlsC
	08M4ai1vM115vaG6rOSFSMVpBPIkTJn1LbTnQU8duL5Pyc6CVUoEn6sTjPTdMOZ/
	hdIxi1ywliJrDL9QL51qrCQweVmlSgVVWHgkLKvR7nA+l9Ug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdryy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:44:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c629a3276e9so32357730a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 00:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786679; x=1773391479; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxV8JoRC/1zVKuUhv8Jl72Dho1b8qSP2ka6EgvBWudM=;
        b=Qt7AmneaGM8OuLEdDH7f19UecHkcLNNwWRfE0BLoDFGveM3Ige+hE/K8VFebVNDbjN
         3Ex9QOB3e+wEjmcXOY3apFLGvKz4OWmR1PyO/602ScTvJEo+C3Szwv0qgTq/GDAbCgT3
         iEZlJRLS4wDVKp+3vDv4eMuaq0+4G3UDg2P6nNMU9NWni8Xq7Y7aFoxrQjcw3BDnrvlH
         6AA3vji20peTonyBuW0/a3Eww0jWCL7cuvVIma8nlrQj4+QN/js6/hO7oVI12zQnoHn4
         9tVQQfPb8kllrsYAyPUq091wP5sT/6Gzq2/lVQ3HmP1PZ1tUIqc19kY/OrUrv0dpqWyG
         itLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786679; x=1773391479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxV8JoRC/1zVKuUhv8Jl72Dho1b8qSP2ka6EgvBWudM=;
        b=sUSPURufO6g1dH8m9W8OpoflcsK8usP/61l0pXCo7vA5HHqR9Y88eQgeZiilHwIZVh
         QbmW8VMlQhbW7oRvK3fjR8/zUrMMC/3dhUEHhq0/gjOZYH7cexOUk1WKRzaQdWtFNzLo
         jG69Vp9BJj5z80tMlcfgYYSoGnuDx0dcg/HQSwMPaw6ZVuC8kBKtVFG57rpCgzN1e25g
         IaE8/a//zAKw0ZbE0g/bJbZSoiPJcrQda6TayE5KTZQtjDPD9/88VTFOGDZ8Gg5HPJB/
         NreEXQWkIk3rqmF3RgArxmRB75+6U3call6j6eWQn1oIlpsCuL/XDbP1ARFQWZGsvI6G
         R73A==
X-Forwarded-Encrypted: i=1; AJvYcCWgM72f4bbJn39Ba9gdHx8IZcJIDtEbvn+6T5KEZPHAyqXYm/jfztv+o8ZKZudFQ0K5N2fGQ/ClZ92Fpp20@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7mx2jKWmO8CrXG7+6dWEdHNJm4wSLjKw8jdhiZJgfhuSJIUo
	zXJJven03i9npEWa5OLC+DrdvflcI9rxDLA+aStk95Us6FHOBT6TPW93P+zNE/y6BT/bfhwYhYw
	Wv5vtiDgiCd9OLZs1hmOfeG654FItx22jIfwOjbTf/bDNCYfGYsiIQ0AC8VoaSe/cpRI5
X-Gm-Gg: ATEYQzxu8bvRFSpITMJ6OM0ZwqR72gE7UlRAbvx1/QvLVvLLRaSkjHUmdgxWQAx0Rwu
	PJ7oXN1l9a1uGJzVjGU/kCN8pAbcnS4v39pgOCdOcD6Q4uuQyKKrUF96U0/Hu0RsZI4PX7e9GD9
	9KivFudfI9j1PFjLCMXiGcTCCcEny8wLI28KcrBBekFDUWJ9U9ksHkhruPi2bn3dQF8oe9W4hVe
	N1w4zs1+r9hlkuKe3BDHUvUE3y85dHRCymFGwOmWSibHZl1zuyBFLjqNgWPGY9XY8JWi0y5Iyev
	g31nLKF8voVsCsocUrqcIkN6ISNJguIY2Zs7ig69QKFQ+UB43FQ58+KY7UcxTtAOOOJPJA23oiN
	EJdnRFl6tGuMCvG4si5/wzFiJXI4rlpScjTr4hWTHiviIXu5Nd83dzTaUVHmNyDGNjQ6Hk5DKPf
	aRwVpERn8vSYLKigguv8Ie
X-Received: by 2002:a05:6a00:2e23:b0:81d:dd3a:b8fa with SMTP id d2e1a72fcca58-829a30c1ffamr1349173b3a.50.1772786679325;
        Fri, 06 Mar 2026 00:44:39 -0800 (PST)
X-Received: by 2002:a05:6a00:2e23:b0:81d:dd3a:b8fa with SMTP id d2e1a72fcca58-829a30c1ffamr1349138b3a.50.1772786678732;
        Fri, 06 Mar 2026 00:44:38 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636c74sm1393573b3a.12.2026.03.06.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:44:38 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: iris: add support for purwa platform
Date: Fri, 06 Mar 2026 16:44:28 +0800
Message-Id: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOyTqmkC/32Q0W7DIAxFfyXieVSGQAh52n9MVUTArEhNaCHJN
 lX599FkD5Mm7eVK17Kvj/0gGVPATLrqQRKuIYc4FcNfKmIvZnpHGlzxhANvgIOmOJnhin1IIfd
 x6m9L+jDUAIDkyoBuHSmjt4Q+fO6xb+fDJ7wvJX0+imQwGamN4xjmrtKtkNar2is3NKCFBdcKp
 l1j3NCKFnjrhdGckd9UBRK4ZIzV9IDQoNAqOQgtdbfKv80NMN78NK/BYbSWWjMWBUBV9ioxoO9
 WTp7Ml5DnmL72z6xsh/7/CSujQGWtrGDgGxD+NeZ8ui/m+rzzVISct237BsOKFNdzAQAA
X-Change-ID: 20260209-enable_iris_on_purwa-a000527a098d
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772786674; l=11483;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=1aiBYfB9S6PFMP/nObYnov2Ynh6O0dt/uvkVr+ApD1U=;
 b=7CxpqpzELPbjcFoyC/CsPz97tr3W5t3ONqwVFb50R/mZqp/jvS7O55xXs9Z0HYld1QIasuyIi
 4MvjICMA5B4AHFUbkBli2EkjFlNtDkWuopocXz6G7IDLmdPDitGeH/i
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: UpT4p5tPVxsdEtjakmXxo9oHHj-7biVZ
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aa93f8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLdzKuw7Enaw83zpX7AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfX+GOC8/qmKYuW
 LDO0jTM/hjCXPFFi5omV4yEro4U43yYBySy88Ss7+OLBrWVsHrddtCVmqUS9M54b9Ms31i/eGvc
 u5swaV39QfzMuniGB0++rTNwZSJOPrw3ZOrHfJiwYS0G1KN64N2Nonl3ryCO6OxYeRq6J/WOvaF
 2wIk2POuZGHJMrXnB9MhkRi4Qp4KyDuxFr/q846+Cq17CI7BmChtM1LIkrurK7a4anl0h8i7xja
 1ONcCU/r3evkCmes+AWeO++dkko4ncIOLiCwnciugkJ6/aeRkWYdMOXbHf0YgmFe4JvcuhNkB1o
 f5BN9LnQ115Lq00MVIHg4Lb2b7QzGHGFTRoghLVKYIY2gsXkOosUrdcLCboIiIMK+3cukHzLUfS
 nyKsvSu/LpTsYWhfOsu0Q1Qi63SMTuqfIQegaJKWkW2fJ8IEXevVDCRGKUs1RIKUNEWdaBWxJEQ
 8jnkvSzxUqeR0KETWFg==
X-Proofpoint-GUID: UpT4p5tPVxsdEtjakmXxo9oHHj-7biVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: CC95921D4CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-95729-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,localhost:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series enables the Iris video codec on purwa, allowing purwa to
use hardware‑accelerated video encoding and decoding.

The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
except that it requires one additional clock and uses a different OPP
table.

Therefore, purwa can reuse the Iris node from hamoa, but the clocks
and OPP table need to be redefined.

Dependencies:
https://lore.kernel.org/all/20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com/
https://lore.kernel.org/all/20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com/

All patches have been tested with v4l2-compliance and v4l2-ctl on
purwa. And it does not affect existing targets.

The result of v4l2-compliance on purwa:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
root@localhost:/lib/video_test# ./v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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
        Standard Controls: 38 Private Controls: 0

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

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

fluster result:
H.264:
Ran 77/135 tests successfully

H.265:
Ran 131/147 tests successfully

VP9:
Ran 235/305 tests successfully

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v2:
- Improve the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Dmitry)
- Add the required members to the platform data for Purwa.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
      arm64: dts: qcom: purwa: Override Iris clocks and operating points
      media: iris: Add IRIS_BSE_HW_CLK handling in vpu3 power on/off sequence
      media: iris: Add platform data for X1P42100
      arm64: dts: qcom: purwa-iot-som: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           | 23 ++++-
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  4 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                | 53 ++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 55 +++++++++++-
 8 files changed, 254 insertions(+), 5 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260209-enable_iris_on_purwa-a000527a098d
prerequisite-change-id: 20251113-purwa-907ec75b4959:v5
prerequisite-patch-id: 2ea4d3d7fbac51bbe48d22b5c58935b3ac96cde1
prerequisite-patch-id: 66cdb67c1bcc2519610764ccd90b551fb8713493
prerequisite-patch-id: ca9086bbde147db45705752a7ae259c76659d988
prerequisite-patch-id: 472b96f74b6d14eab239a551f005f601af9633e8
prerequisite-change-id: 20260126-purwa-videocc-camcc-00e709474bef:v2
prerequisite-patch-id: 89de12523520208c6f76abef7e2933e69a9206eb
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: f71d41a700114c289e7fe9cf8ab724f6dcd98806
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: a47714ca9394708d96ec1b28bb7635cd89fd6cf6
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


