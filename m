Return-Path: <linux-arm-msm+bounces-96205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKv7OoSnrmkFHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:57:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 581582376FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0922E300C9AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D71439446A;
	Mon,  9 Mar 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSFscetU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZ/MBuf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52A5393DD2
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053824; cv=none; b=WIJToDkj3TfsbQktFbXLFh56pfKSxNymep7MhvSWVvSZi9B5J7aO5AbBDei4kV2uvyJQ8hzhe6kEFP7EaK26I7Qvr2Zu0PdYXoxEg8VJQuSYOnnRIMdQySmHwg4DDqZN+kRC6y6U4Vu4u4vJ/JcRoetMlYNTjl4a9fMkv45vduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053824; c=relaxed/simple;
	bh=h05n1j2+/XTNmxeWIGdrGzFT2nPNpwxAzQWqQrwQYXE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ICLp/cSL75uYRkxelkiAeNfvlQqXUWsurn9P8kq+ZkkuitDTyI5qodOkHaoatpXJQhgtas+BD+N4BKwbRC7DNIdLWuCrG6XyuF7/SqmYw00CRM/p8iVCA1LxPA1O+6hVRxb+A43dJcO6ejc9kzYSw9/CD+cd4wU6LSEaAYSrY94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSFscetU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZ/MBuf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295xrP42464068
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/0hw24bFTR9TQIg1Z7GNez
	wbbqnhMlwTf6wvITfaa5A=; b=SSFscetUYDFyAr3OqFL/IukJvIPSY7EPFlsS8M
	6dL/LzXCuBM6ACNva1Keri/DRY/a/jVOTMMWxCpkb6j/eyokQE6nubNWssxRO4g/
	j2Qe3o90oZeSWx4/srdGVw4LkYIUs59KFUg+iXM88L53c8VQ+hvSCZircVengiJe
	hGdx6ulLlRCngNuFe6nFfaoQyxnW4x9L1ub0YM6yjAsevYaXYlChJV49E+bcTd0n
	vjMh0LP1lFRr1Z80J/ZKXD7FyUtifHStVma1IDDsDQKarwJzNcRFlHBVrHJyxigt
	RFX7sbHbqn2dUkDuc5vk1XLowI09Y++ZDTAR0/Vv1jWAzzZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrn7j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:57:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77502295so1098670085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773053820; x=1773658620; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0hw24bFTR9TQIg1Z7GNezwbbqnhMlwTf6wvITfaa5A=;
        b=eZ/MBuf6ODoozDc1mNwBeGVVt2EoWXEp4/14UAXJqwPvFm2DP/yCUWbJ+tn3OBTDoO
         iyLNiaNJMEuJ0shFErEAl9xTFTD4JrhoIrBMRQb+/TpkQa6OR5fJ5X9u3MHtPBcuv5js
         jOHTmsAEaHSPHS37kZDzCBZ6/mHkmaTrR+IkbbqxEZzzpzlXi3wPr1/CvTgB9/P2oSv7
         eb0Paek9/X3YOOgdNPYpI/jyH0Nr6IAxxSIFFB7ZVPl2jJ1ll/8w0Y79K5goGvbNOLgj
         uWs9hDUyzs2v3/rcvM/2xDAVcLK3/xl/TRuIZosaltAfsIHNFfiElDdzQTPiY+wThIYZ
         fjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053820; x=1773658620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0hw24bFTR9TQIg1Z7GNezwbbqnhMlwTf6wvITfaa5A=;
        b=WbeIVfL+REVxeuv9z6YmyTux2EyXOZhr95SkVSSElBEADhm2H6Ovb9vYb5XbOD9YNz
         37bp10uMv6pXtnqEL78Cq2K1TPvZESyt4RrlnBlTLtrxCIzybAXGvTWVaujwU9PN/fkQ
         rJvpVgIeQAXpnpBJR94Fw+wajPpqdP/8GAEg0F0Xpr1a/+gMH5sztD/3zV2nXJYfVnbx
         QlZYS0+13lOJOG5rbQ1HI5qD/E/WuJkyPRrWk0kDV7hpLa9r0nd9Oeu/giUc1khCSrJR
         NlXZf56JUHPyVtNW4S2Pw61VebVFyiHhgfyZniOpFqCvLqy3DUSlrc8YcAfjfUotu3Tg
         W+ng==
X-Forwarded-Encrypted: i=1; AJvYcCWDsFhxoTvqoFB0V5tDDHjK63ReJA+2/+9IQWZwMS/mhC4B/CWfdPKp0KV5mT9oqccQjAxF0OSDnhfbrhFo@vger.kernel.org
X-Gm-Message-State: AOJu0YwlEb4XVxY+/tCh7Vs9mZOH31+dxAOo6ecpD2MJPnxISRAjaCVS
	N+yXwSca2ot176PXYXYNNfI3rEOB8znWkvOxwNvj3jTvVSUy9Ur+RIc7deLdrGWU5j7N8uiR+s4
	2UKhHvZwl/hQEjI5spO9ipbMRT7cpf/HAAYJChSIo7d088FDUOIyFKj0ZtH381IOvg3k3
X-Gm-Gg: ATEYQzzqrKLU5VC91LWAUunjOXhUmeVX3aubZRpCEyHScZgAW7eoXCipYFMakSgz1cS
	o4BOdyF75bOwd8MhRYxtRwMrA0GPBU3XSOFYMv/seYvtt91FliJRb8i1f9XKGLgKGBwhlCP7ZrA
	n/u14SAgKTFrJbG6OweLDSBD1U7yQL9zNDA0Qfybht4plwFRcOZMY/TxBHq0+oUQyixagGJDGap
	Xbdm0jBdYu8qHLq0xuom0uTTsXwgPG1w05bQ5pUHSDf0PabolF5275EU76dbZ5OCdsKsIeY8UrQ
	J/vBCA+76kgaiyoXP1KMtrZRfq7VOXk7KggLSuKsRRnASJH026CKbq0g8HnIuTFpZBxclSHqODW
	BwvZiHyDvPRP9zWtqJYnB4xRM39rBXw==
X-Received: by 2002:a05:620a:470d:b0:8c7:8cf:537c with SMTP id af79cd13be357-8cd6d4a521emr1298374185a.37.1773053819487;
        Mon, 09 Mar 2026 03:56:59 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:8c7:8cf:537c with SMTP id af79cd13be357-8cd6d4a521emr1298371085a.37.1773053818921;
        Mon, 09 Mar 2026 03:56:58 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm26169971f8f.13.2026.03.09.03.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:56:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: glymur: Add USB support
Date: Mon, 09 Mar 2026 12:56:50 +0200
Message-Id: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHKnrmkC/42QQW6DMBBFr4K87kT2mBjIKveourDxkLgNgdgGF
 UXcvQYqZdFW6cbSWDPvff07C+QdBXbI7szT6ILrrmnIXzJWn/X1ROBsmhlyVFzwCmwMcKu7Fk6
 XqR08aGthCAbC0Pedj6BEYZStLJdYs0TpPTXuczW8vm1zGMw71XHBfm94ug1JHbc11lIIelUfs
 lUsOUJ/njZxKwVQUiK0+oPAU086koeujym8vsCIIMCaphB5XSDfq2MXwu426Es6b3fpWbRGB4L
 lw8VDprkm1LhXPFdsiXl2IXZ+WnsZxZpqq0DIpxWMAjhUpVVWloVtuPjpXxQjPrCI/8BiwjY58
 UaW1qCwf2DlA7v09hQrE7YsJRlUldD8N+w8z198/EQeKgIAAA==
X-Change-ID: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=h05n1j2+/XTNmxeWIGdrGzFT2nPNpwxAzQWqQrwQYXE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprqd0s1//nP0uoTYwvMG9sy9LJGw9X8Z6JbbqI
 xI0B6pL+3mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6ndAAKCRAbX0TJAJUV
 VjdjD/47/oqCQkWI9SRHTdS+/ENJVWDAN6dun/SQPNpFUCVOVV45TZN8cN2LSjt5mkK9P3grSTL
 s181BEJ6FJ0JyqK6qYsw/Vxd6nhgjlnAytGyynxfVQhl8SMouyKNcudkTgAa5C4ldxDJogZZGhY
 rXNafuDkIOkVcRWMkjl3s55BqbQXDqCClBx10REMAK5Jz8zvIcL6Xi8tjyGlMYOrDVgfeZQ9Crm
 uEEklelNegUBapskJvjm1+A7WKXw68tbizuRh39Y9XY87Bg4WorHFNaz0iuATPfTmlT91AbEdOq
 J4AcZbDGACIoj5elcFtxJbyD6MCELXBfA7CrWpdz07e/4kt6G735lbr9rMluSKPgKdhku5MCez+
 tY6KQIk0cRM1mVlB3Fx6Vef9xQDlZMgrHcQyw41eFQGcKFr4ol1UpnRGzxuH5ZkBaJdk7258CTW
 qegom+NSyC7AzadDdOXsvAI/CACF4o8NraJGoyfxEeFqUMMFtXeDAcQqLZo1ZqTSq3B2GnIchOV
 WSNWgDdF07bp/FoWWa7VzqT5dIA8l3cfM8EwfnE01rQmGH96xaoqcBTWwEN0qkQOB2SaPTT2Kxq
 wwYl1VSuoxUwyCKCbOG8I/SsGtqZNRbsRExswav7FcpCSokeu8nbEbgmYMUdnwTkn1VQarzRBWl
 EEhbsNk+GIVgnPQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aea77c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=E5JcmwgiqHGAA_JIGHUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: X5vdg8FTVsbL79TZaIYXP9tiXo4cfD0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMCBTYWx0ZWRfXwY0ndImRm5y9
 TieGoCjiieOeOrDqjakvTTMUym7niCcSaFon2DIMv6A8Jxk8f3DWA/fG3TR8oC0OHuN9bNbg8u8
 MIpqgdIqP41jNRRMKx5W5sxXoZ5dzmhtE9IIIkEVOO5umyF6ZylMOD8bTICiXaufEKF1qrmv2E/
 2gDDARGIwxYpeSi7aoO+e/tpJM5LItAUphRt7Gu+ydJvNwMRNTPW7SUC+6aXgyo+JPAgecn4O2Y
 7Sl/k1WDbXuN2OnIs7OimEa8Teo9rw06lxEoqTYN+rvkVdu5yoP/SGjkOM6NcP7jRqV1oB6aRs6
 wLwxJ6baWGEEIALyOiy/uaYtGHhCH1/PIwnNcEUeD1UJZjS8E7kr9nUirZ11JGQi/Z5mTL3HdMQ
 6fuTLmOpodNhb1XyQzZN+5xHH9s7SyYRU6pat0A0RXUdZu6ceVTAGkOWuhnvrFp+fEJ672wOii/
 FgSxA6459l7kToMC+5Q==
X-Proofpoint-GUID: X5vdg8FTVsbL79TZaIYXP9tiXo4cfD0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090100
X-Rspamd-Queue-Id: 581582376FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96205-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for USB on Glymur SoC and its Compute Reference Device.

This unblocks the upstreaming of the display support, since 3 DP instances
rely on some clocks provided by the combo PHYs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Dropped the RFT as I've been able to test this myself now
  and Pankaj tested it as well.
- Added missing second compatible string to pmic-glink node.
- Dropped the 3rd Type-C port support entirely from CRD dts
  as the SKU that I have only has 2. Re-worded commit message
  accordingly.
- Forced dr_mode to host on both Type-C ports.
- Picked Konrad's R-b tags for dts/dtsi patches.
- Picked Pankaj's T-b tags for dts/dtsi patches.
- Renamed the second PTN3222 from "_2" prefixed to "_1", as Konrad
  suggested.
- Link to v3: https://patch.msgid.link/20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com

Changes in v3:
- Dropped the PTN3222 USB Redriver @0x4f, which isn't there actually.
- Dropped extra newlines from pmic node, reported by Konrad.
- Link to v2: https://patch.msgid.link/20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com

Changes in v2:
- Picked Rob's R-b tag for bindings patch.
- Fixed CRD DT commit message according to Jack's suggestions
- Sorted nodes in board DTS.
- Added proper quirks to all controllers.
- Added RPMH_CXO_CLK as ref clocks to the USB [01] HS PHYs
- Replaced 0 with 0x0 in all reg ranges, as Dmitry suggested.
- Renamed all usb_ss[0-2] to simply usb_[0-2], and the usb_2 to usb_hs
  like Konrad suggested.
- Link to v1: https://patch.msgid.link/20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com

---
Abel Vesa (1):
      dt-bindings: usb: qcom,dwc3: Allow high-speed interrupt on Glymur, Hamoa and Milos

Wesley Cheng (2):
      arm64: dts: qcom: glymur: Add USB related nodes
      arm64: dts: qcom: glymur-crd: Enable USB support

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |   2 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            | 214 +++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 691 ++++++++++++++++++++-
 3 files changed, 901 insertions(+), 6 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
prerequisite-message-id: 20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


