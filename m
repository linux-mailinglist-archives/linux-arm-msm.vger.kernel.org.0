Return-Path: <linux-arm-msm+bounces-92264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id B68mOeDZiWl+CgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:58:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885110F423
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72B9D302001C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA5B36CE0F;
	Mon,  9 Feb 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWGGsfME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jO1gX6iY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6680836A02E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636646; cv=none; b=rho5BNxDnymO37Hps4LGEbVwi1q5qeFR07rXkxJxYRhW4kN0O4wY9tHL7gTsN2Bk5K2M4RfscKhuzQ0hrqY0olgDc8RGlobcatgeSGnsOpGQM4qwaBD26L2l8kBG9ivNHoBr3q7gtfdGSQaTRSUChA5pI0eoJJP5CeZTHvR9yQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636646; c=relaxed/simple;
	bh=LJTQ4upk2DFz6zJpmgkRlk+DQochJjNc90t0hGUsXRs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qO/mrLDVIfBym6J/nSRqg4lQ/U9zy3SsWb+PPBhUKvY1OxP+QHUFIhw5/mbxisw3evqFp839NbnTp6nvIgUvw7FHRBwLwmEPq1J6A0VDAODvoNY+55UXJ/vPlYTDj4eObbiWG/1nBhohoOzvkKpnY0OrXtClZMpN+8NCXd6HEmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWGGsfME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jO1gX6iY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BQOJ61922911
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 11:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vlfkCA0YDPUgh8tVaG/7M+0PqtnsS0vhirg
	/wX2V73c=; b=mWGGsfMEOBIQY58yq9Nj6xVD8lMzMVCGorIXynyhJJBdVEKknmk
	zfi88lmWteA4V5c/FAnRkDk5t7E4AQjBBdaG8n4UGhfHK8h1+0bcuvpd3TQUEOLg
	31SxYKP9v2ll2YOHAsFeUBvKGPWNEstihDhYwl78Z0WuTsLtT6r3rPbA5gXZ/t6e
	XPDuz5nOuo5fSinZ5X9L8jdpF7ZwlXq6YpIAyJ4L1Oc7E9eOeYQR2m7YCL8gzp1m
	ZF2yGDF+ddxtPDXuW0/JKx0oi/VicHpFv9rLf5Q9EVglv42pS8p57KXauAYsTKNp
	HxmIyCwOEfgFkVSmZ3/kPiurTrvmfQb5iAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c796ks85u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 11:30:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f2481ab87so4364493b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770636644; x=1771241444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vlfkCA0YDPUgh8tVaG/7M+0PqtnsS0vhirg/wX2V73c=;
        b=jO1gX6iYebC8n8Tjn4exDOrKUifr6oQ3JEeNBnwUksG9ojVh5+iftTeHlkz4l/w4WN
         ZPRM6usgsfYff6N7wIcTBRDck9NvZQBg7611WvA+ba47Y0rEsS2CgyLRtQEAHSWg/uwI
         eh8Xt5sihSIDs+BmB24TRRT1l1I6wwA4Vrim9NdnOtKPZo3dJOuSTLOt0QO4m+jcTv/0
         rRbUqaTN1vBHaIBiITEFvn+7EKfHbqACVn2MBBfvYHhbDASa/HvTRgbqwFrYO6xcR1PM
         ZbQa4oXmBkzk/VxXbwLkejkwRG5ae2L8fcaNipHZl1lVeY49GoUeFjSn+Lqo7k6ndRvv
         Aqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636644; x=1771241444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlfkCA0YDPUgh8tVaG/7M+0PqtnsS0vhirg/wX2V73c=;
        b=ve25uGLxmsN2nMy9aoz0CPzOGDm/ugGlK8ijxcz5eHplfjg4uM37bk4tOhTi5cyecz
         daJtbg9PFkJUWjO67hNiY+0D96DQEQKbHSBPr5U0XcpgAXhtOi6Z5Xyd5YJ4P7FSa/oP
         FMapnOuc72QcWXIILpzK7siZIcmqc0KibVcCv0dSbHEWpT9nNDBGYrpvVi1DkjGQM9HZ
         KrcA+xfVx3ejjYbtbyp7wxvulOPjLQcYr7VjEzh6cobBoLRmt0bYjuxbMJQDo1vgUogF
         k0y9H7P6Ooz1ZuIYV8D9zaejj83b7ervK3oR0eza1Sk0tKL1M3bcxY86nk29igItM0k2
         d+Nw==
X-Gm-Message-State: AOJu0YwydajAhcmbfFEsW+UornWUKdLOk1YUFXlhwwrwGX2Us6Pbc0gi
	ibiG4A/PhmOaNDVvx7F1EtN1JYqbeDUaSMNM4If4DfUz08HXKpQfK1YQmh0U3JT5HgoU1KWaXLF
	gwNIeNN9mRuV/0BZ/Gp7MxQkBOqPKfOpOSc1gSMF0S7ug4arvsCRHRknapO36F80Ad02O
X-Gm-Gg: AZuq6aIwY1SkExBRNB3NafBc8IxsBWXrBqL6mSz3AvYjxSLrjCc6rln4eOPmCm751AV
	numc/gvrs8L7FPYt/zY4C0ftZiP0F9EMDfDwicISta71uGN0NT117aKnGIS0HFBATIhmXT9ShxI
	OMYerH7/T2tB7VJpSmkKu+7JNi96hnr/Fjc7ZPv8kIASI+T4mCipANzByr4NuWOGJNCsrpH4kwf
	pKCr7lyEwNXxMZ8tcg8d/o7WbcZXAXv/YgbfbLDVCbrOLgmm0kuzjDxbTfSCganxFbu8Tkx6y3O
	x5KVYCDVK7Eq7Hm6yAAne5x5HvYyREildkjuPwsax5x73TIsvPJVheLEcDz2Jjar8XVRLlX0NHF
	q+PWh3eg9v9FYcF+wsFmp0bO8L8d2jOX4eTkwRqKymuM52w==
X-Received: by 2002:a05:6a00:84a:b0:81f:2b25:ca73 with SMTP id d2e1a72fcca58-824416f7e8cmr10227683b3a.38.1770636644408;
        Mon, 09 Feb 2026 03:30:44 -0800 (PST)
X-Received: by 2002:a05:6a00:84a:b0:81f:2b25:ca73 with SMTP id d2e1a72fcca58-824416f7e8cmr10227650b3a.38.1770636643755;
        Mon, 09 Feb 2026 03:30:43 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441690235sm10399467b3a.18.2026.02.09.03.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:30:43 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] soc: qcom: pd-mapper: Add support for SA8775P and QCS8300
Date: Mon,  9 Feb 2026 16:59:45 +0530
Message-Id: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IeyKmGqa c=1 sm=1 tr=0 ts=6989c565 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OMXUATunJQp3wCN6LFcA:9 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 2wjbWdrC25qmvgth22YyKN4_dE3dQpbY
X-Proofpoint-GUID: 2wjbWdrC25qmvgth22YyKN4_dE3dQpbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA5NyBTYWx0ZWRfXyU8iCpqidHJC
 lYyBAleYPNMjzwOa0b89MnuFs6kvXNg/+6e28nInU5gDZLqTiDpMvfPJpYzw2AZbNtQEH4C8WNM
 Qg1Tg6OEomZ7mZh3wM5vAlUJtInRnWJxNeqgGTSk3THBn86LyZKJtaJwUqFhfEVFJP9VouVMkcl
 1DYHqJ+c7R1+sdrJEB1UeRna0ZdhAQt/ZmKa0k9FCTF+0EtSfsZMPfSpfe9HUi7BYmVNMdJY9KY
 u88IR8NGFzNCTpySrAl7/Ek0akP4+uoBxcpJ06CiI3ZA9rWbWxHRbnDAk4czI5uHrVnei5LDIdv
 W8AF6DTOCbcK3aMlhApk1HyjnFyt8DBz0d179q+ucDROk57/dTHgGAoeeX5aYXrzQQNEYIuGpjQ
 HBQJ3wRc06YQRxFgSZhVvCaZK0jLqN9gY/iQK6Tm+jJT5P0SUTwgR+cV0E1ZJltFoCHaCfvvY/2
 3OtTUA2hBcpPV8xTcnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92264-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6885110F423
X-Rspamd-Action: no action

Add support for the Qualcomm SA8775P and QCS8300 SoCs to the
protection domain mapper. Add an entry to the kernel, to avoid
the need for userspace to provide this service.

changes in [v3]:
 - Added a separate protection domain from QCS8300 as suggested by Dmitry.
 - Link to V2: https://lore.kernel.org/all/20260127144315.4125110-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
 - Added missing GPDSP protection domain configuration as suggested by Dmitry.
 - Link to V1: https://lore.kernel.org/all/20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (2):
  soc: qcom: pd-mapper: Add support for SA8775P
  soc: qcom: pd-mapper: Add support for QCS8300

 drivers/soc/qcom/qcom_pd_mapper.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)


base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
-- 
2.34.1


