Return-Path: <linux-arm-msm+bounces-94138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOdqLuQOn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:01:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0EC199214
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6AC9300CA0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6614A3D3D09;
	Wed, 25 Feb 2026 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWNIsExR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqIcsXB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA93ACF0A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031705; cv=none; b=YQUItJmw4KLRJJpcn/ie0yjybNUTw7WRD1QIVdSzL9m8/bbNOdBAuoJLG4NiwEZcRNRWhX3U44Th/Ds+Wrmvxh3DATsLZrRJwPSgraS6uP4uThekJeQtUM+/wxebEeJbiQTCoucylWDQOlI1Xdjkruo77llpuZrDuEVkJFX0AYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031705; c=relaxed/simple;
	bh=RIbBVBZBpWm3eVYPjSk5j8O8TsjLMxbXEyaTd6pNQu0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KMAG+nOtcOfnm4UP/dKtFLjyIzQX5uUEgMAYZlvJlBVJei3cy4224YAizNgXFS4AXMoejMVaH0J4jgnZxYjFl/iM9Vo6BjorX4nYQKwFax5bz1ID44EOckeYvDaQa8LcykCX5ra2aCNM0Rf9d0/+RbWvR9KHdql2ZVVKSspFQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWNIsExR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqIcsXB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SI201363608
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ff8JD4/Dh9s+oB5oFh9aV+
	v035+dl8392UeJdRc86MA=; b=PWNIsExReEvTqdZdXO2MW0lKbvWdcq/MVLOFU0
	Y/Mnd6ojmRBbHe/nQszVSx9ccDDddkDPm5pTQYrM8gaIahs0fCQPImiu5vcIdlOk
	s1PjpWmg6Hp+u0XpZTzQHHUQehA1Ot5oyIDgGelcVMQNq53Xbdxe6mjTI/3l3n/J
	/H4Vm0dDHpbzKmq3bKBGYKVVGR1iD0wuHJVYPXcXuXFJhNkZWApbrY8tD2h61HMW
	G3xqSu+gNVSehvUj+1qioTgXLwr1XyB5M/mg+vvf13sDrdSnYTKCuNKcMSrKnwPW
	AQcCyiAjsh05LUkD899Ic0dXESehnZ/MZpuWxfRX03qAlDaw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp15ac55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:43 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-679dcf1f680so31424943eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772031702; x=1772636502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ff8JD4/Dh9s+oB5oFh9aV+v035+dl8392UeJdRc86MA=;
        b=TqIcsXB+Zc6QwWJQ5DR2ePBiXkKJDdJoMZJX5GxSnpHYWWfs4qdFw5yVSKkccrpZEC
         iKHssBf0EKi9t/tOXHJiDX7pxWnioNTsugv8v3/lYIHBGovrzAiPeLuMwqdQIKEDkrvN
         HVwG7enugC0flVCHMSwAkT4CcOc4asNTwvlGUH5PPH5EQZJg4Ez9SIkfn7eMmemRT4WS
         DSbpIce2NMbS/HETJPcA0iQ9uUsPdg2muKPcvrv0LalzAxiG0kKKyeDB430MZFfv2WOB
         vzqslUkUPvzT+tkaV6hnba3VHjnw9q8J7VkT9QELU5cuxN6FifywBX6UUoJIVrap5nRs
         oFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031702; x=1772636502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff8JD4/Dh9s+oB5oFh9aV+v035+dl8392UeJdRc86MA=;
        b=GIxpq2yHdGBETYexcSHcWVCRhryfAi/KJfFGVSe8uHZO4hy68HLIJ/gQzrGQT88jgP
         FFDISJzUzts5SslVuESB9is5awsiZ4aetVGwDKMvZYvZvFQoHcjAA1moJcppXXMVTICD
         Vh4cxTYz4oKT8Akz5/BxAi+twiNSRepKp1p0YUiJTjEcXh941jZK9qEi4ocvmaKdEAOz
         UbgnPIPkndsWGIavWOdFpx+ttsfWRW3V3nQMvA8S2BC5RlhTmRHrK8ebTMVEQYbDFS3Q
         UJr5WTO4XLVSGP+uZyXAVxDKuETARe6sBgioRi9VV69xXB/UX9FKP7SL6g1V5cYKPFfd
         oeHg==
X-Forwarded-Encrypted: i=1; AJvYcCXFu7g2cNlAgXmz6i+GNcMfg7CRoVIWdQ3WLKT0nueS3G0+4JNGvWnPIe6PCZ3bc/FRpRl9rLDFDzB2GFaN@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZ7FrC57eopTGOP5fUFQI9csHe4iNYmYatD0b4WFpLhsWkooZ
	Kd5dmCqyeaTzDZstPSiVitT1i8CqAJ6Hv/PQhBwc1NLOG67wSOb/uHk2NvDzBXD0bPDhzv4xi+e
	k8HGTyJhUAIeeFsSvrXZ7AJWmpba6zd8ZnmXjwPn5oPvSwB9Q3xQVCZ4qfow/G/lK7TkU
X-Gm-Gg: ATEYQzxTkxbmJ++SJ1tk9r3h39ySZwK/isPHfhqDJZ8MwRXFc5zy1xqq9SAFUMNUBDa
	eOTPIpV5HiGBnEpRo0kkMR1AR895STsQY+Ven2xPebOYBPYRe0C3BA1hQbQ7+w4JBoNIO4a139h
	VdmyuV0nhCH0S1cJimh/cDFGEq4/oNmBUm7gF5OJGw9ElbdQFcZQjw62wk9UT3FhNt/YreZ/3u8
	Lu9IAkcAMLWu3qs4r+BaNwuSpsFjkuJ4JvJhSv9AOoTsEKiJ4O7RZ97gT5qxEIv0JBhDhCID+TM
	ROyd1rGxa8sU7x6f1JVyo3j3l9Xs3wD6pUuzrCag4cXuTDxJOStgq+CNlBqxgIoBDSR7OLRhoFd
	1fP2sjFABopZrq3lGv10a411iinMrHxumcD9UjabELRWXutoJYRyBJn+0F4W8vjEHmi9sB/h6H3
	1kmurJ3NNHypo=
X-Received: by 2002:a05:6820:2216:b0:679:be1c:caef with SMTP id 006d021491bc7-679c44f9608mr8478551eaf.51.1772031701561;
        Wed, 25 Feb 2026 07:01:41 -0800 (PST)
X-Received: by 2002:a05:6820:2216:b0:679:be1c:caef with SMTP id 006d021491bc7-679c44f9608mr8478520eaf.51.1772031700606;
        Wed, 25 Feb 2026 07:01:40 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4306552a12.5.2026.02.25.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:01:40 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: qcom: camss: Add PIX support for CSID/VFE‑340
Date: Wed, 25 Feb 2026 16:01:17 +0100
Message-Id: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NCBTYWx0ZWRfX8TmkWSLgEXOV
 HsbZ2Ml3ZrG/PzQrjEZkMONDqaBjw35xYUpV13eXZf8lTwS6PIqLr7GCJ54Jto7UFHYEIG8RblI
 rBhRUhh9D+JA9ixTgihHgKJhY9mIbfeiU+8HyX8OW/HIF9IGpyRQvQfsJ2vQR0WAFGulJMtHVAV
 B+aPihxtsWyhcQEVF8lcpowQIGmVDE4au0KIuuIpmg7k8p0iioIG+BQsEY57rRYO0mZRoDfm2GQ
 wJuCI4TMecjT1VRkgMzd8gQW15A9qNSy+2ZrAOAjGAMYdbmdtMxD38zk5EI/fn3LCzJAyO5ea9B
 K/SS2eG7tGNP8oJ4IqjzI/rkVUoGFlxyn3qVL8iTmSuLfwivNlMnvNSqMV2SfJhPYLWqcWHuhWd
 1bxtbA48ZCcj+1Ifs8joEvAtdFjMG7+rgDuRZc6ZR9XWl+INGvuVQCf84KirRU5y6LanuEOSePv
 Tl0Vr03qEAWI4D/nF7g==
X-Proofpoint-GUID: wjglvj50eHvWVreJ6nUZc_vOtRqyxMxK
X-Proofpoint-ORIG-GUID: wjglvj50eHvWVreJ6nUZc_vOtRqyxMxK
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699f0ed7 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QLs-j7ecQSDb903mvAwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUBJECT_NEEDS_ENCODING(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94138-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D0EC199214
X-Rspamd-Action: no action

Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
allowing frames to be routed to the VFE PIX interface and exposed
through PIX output devices such as msm_vfe0_pix.

On CM2290/TFE, the PIX interface includes a minimal inline processing
engine, which we will be able to leverage later to export statistics
needed for proper 3A frame processing. This also fixes the PIX path
not being usable on this platform, as PIX routing was previously
unsupported, causing frame capture hangs.

Changes in V2:
- Fix various typos, extra spaces, and reword commit messages.
- Split the CSID-340 patch into three independent changes.
- Make VC/DT-ID configuration explicit in the CSID/PIX setup.
- Add the csid_vc_iface_map helper to retrieve the interface offset
  from a Virtual Channel (VC).
- Add cropping configuration in the VFE/PIX path so that it
  respects the crop parameters defined in camss‑vfe.

Loic Poulain (5):
  media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL
    registers
  media: camss: csid-340: Add VC-to-interface mapping
  media: qcom: camss: csid-340: Enable PIX interface routing
  media: qcom: camss: vfe-340: Proper client handling
  media: qcom: camss: vfe-340: Support for PIX client

 .../platform/qcom/camss/camss-csid-340.c      | 108 ++++++++----
 .../media/platform/qcom/camss/camss-vfe-340.c | 165 +++++++++++++-----
 2 files changed, 196 insertions(+), 77 deletions(-)

-- 
2.34.1


