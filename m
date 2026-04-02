Return-Path: <linux-arm-msm+bounces-101424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD89OHwDzmk/kQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:49:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF3384271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F75B302F16B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 05:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D711309F09;
	Thu,  2 Apr 2026 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je6fmDaN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhmQav+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD732DECA3
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108972; cv=none; b=Skp9tzDZwT34sm1U6f+lUBMZacKMzH5fm14byjL17NeQmRFSx8taUFm1odnIP2L3kGZqtmsA/u0+vi3ESqIxOJptNBqbhzRlF68E4OmhSk+JysrR/SfndACSPuwku50IipEnfhqzdXQK3ZvT58waQEuvehfYcDAvMJEpczscxa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108972; c=relaxed/simple;
	bh=iUrh3kmE5ebvB4AnkHePTW2S/+IVucOQu4o+t1b+4yY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bJ+eZAuMPsgphd5tLHvDSYy/phydvAMVTxnMBKub9JlZnzTRBemK7JlzrAn9aUEXo2fLEDGgkECfOSFyBWACtJbCliN3enHLKLwIlSW+R8MagiwTJN7XokZnIxm4GEQ2PVJGlxcq/yrYBToGnpfLKW1AKxJ+SFKLZY6qUYfA+uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Je6fmDaN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhmQav+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M56NZ1426037
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 05:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ioNl/pbmY50Wz8O6AM4CCucRvI07piSCemk
	mE1yMrHs=; b=Je6fmDaNLeT7seeNLbvjIUiNWqzDY3swDA9r4z2vZknpE9ZL38C
	PZesqM1onMWhFrcbIVJq6Sl1NBqI70NxgPyuZVCWOnZMx/BxzhAYEtZfWesRgYer
	hWNggZg7OTvrZD68jL47A2I70OhkpUFBvT34EayelhzQYQJ8Gj7mbh5naRXqosxw
	ZniHKeefRddvbFlcMB/3tBZL3/5mVtVboox+J3eHxnzWFRh1XkT2Fmk9N5puBI8O
	eecdMgMycZDyzGon1gN/o5Fa0CU/O/eDvy8zeH8p4CMnwKG2aIEstbkmovNmrmTj
	Lynk4vwd9zGRFAVXIHTNYHx9UXStRWwcKdQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511b33g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 05:49:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b15a3ccfso210100a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 22:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775108969; x=1775713769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ioNl/pbmY50Wz8O6AM4CCucRvI07piSCemkmE1yMrHs=;
        b=KhmQav+CHBjo4JsX6nWKE6HFDa6aw65aD7aygHEUDW5y98wVCqwIi2mSxC9BfuMIfE
         8V2L5TavBfHjDHDjRjFBSc41CISfCweiXFkgIWC0+YBR7EMG9kc9kiawJmns+OXmeUfX
         APMLh2n9bDV3I4yFAg+Q57PR1lVJeJhAzk4WnQrD7a8BsNnDDsoRTsr/oPkOGBtUH3Oh
         9zw/VJMZYRKmTvK/txRvFjgC83+bEy8VwXZr9Eo6UiLFXqitvtvcErmmPcdaqhnQ9mS7
         kS4gWCzk51dDvx1bNp+8t1mz8K7t86r9YAe0yvs0QKO9rNacFzSZte4W4oiNp1QeEi1D
         GT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108969; x=1775713769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioNl/pbmY50Wz8O6AM4CCucRvI07piSCemkmE1yMrHs=;
        b=XmHOxSvjjuj/uwM9KcH0fDIDsFPGvdlkHYVq4CCKB3YxTb5XBsVgXU5vPWyNsAigEX
         ZxG/uWlzMr1mf5Pn64hdBSLQRPYGqK8GGR8ty6LBo39g+U9ntIQVH6Nd8rwNcps/QIvM
         8wRvYx6Koxeh6otU14aKqLC+arw0LFeaaa4AuqCbfjgKslFJN08uvcD1Uoq9v2jNHNz3
         OW6qI2wBzapw+/3V4jpHBJi020ND+49zT3Ty+PL9R5d6AsdhNNPD4uTmxFy3J2Un8jHk
         sCOqX/+WOT1IOPAvXCd4dT1gWNLaHGo1UPhziZamn/YliOU5DpSImeYAOo27BbcVrPhC
         go1g==
X-Forwarded-Encrypted: i=1; AJvYcCXeWw3FbcUr8n/f4P7TPMHJvRv1CgbIZme4U2hIzCK1OP0gv67tZNXLuORSfu7rRex7DUYyDvjI35LpcTlx@vger.kernel.org
X-Gm-Message-State: AOJu0YwWOEZ+tjilM8t9ROPz6rcOSZSs9Y9TaOwxxQuwumFmfiMCPBZC
	nF97m8GGl+U7wpX3MfEDZu3eB1SWeGy0Y6pv70PA1pBl4PNvVcMRJrSGht6TQBd9JaCm/kcM9rn
	+HEyQeZGeNs3xX30gR9TgM0jOligefCe0a4YcVdn0bqPXfA87Nkf8iQJB7BBoPlifBkOa
X-Gm-Gg: ATEYQzx2/pMylYa8HSk+C9AUrJwunARLvbrS0xBNclMI2t01l0XrZLLH0d9bFkYXqyY
	hLpaPC0U0JHRHq38LWh+CKeccV8pWbrQT5A05YcMFVi64U32dAnfZCvLXIlrp5E5Qoh5O0GnrDE
	QCuflE53DerDcAynlRLKWHdOHX9ve43G4Qn9h7STiOtRreIu6bp85oYHMXwhLY7GgKA/F+nf6au
	aKKY1yzyj7GV6ra0zVFmhEPsnh1yt8ZVc6wVSes69YHi0PrLECeCwaEiLoaRfTSGI5tIPNIkrCd
	9QuhZdexRoXAPo1LkU2odv4BKwDVwHQm9GAYheEF88L+yYbpT5KZBNdVZWhm2T9udc+rZS6aWeR
	Z9sOSIdzDgeS0rQ6e04NOFp30OMy73uozsE/u4oh56VZMaz97ki4rLg==
X-Received: by 2002:a05:6a20:9392:b0:39b:cbab:63d6 with SMTP id adf61e73a8af0-39ef71fb5b0mr6193180637.3.1775108968824;
        Wed, 01 Apr 2026 22:49:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:9392:b0:39b:cbab:63d6 with SMTP id adf61e73a8af0-39ef71fb5b0mr6193159637.3.1775108968326;
        Wed, 01 Apr 2026 22:49:28 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm2167747b3a.26.2026.04.01.22.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:49:27 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v7 0/4] misc: fastrpc: Add polling mode support
Date: Thu,  2 Apr 2026 11:19:19 +0530
Message-Id: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0OCBTYWx0ZWRfXyu2amOAiOXaN
 O7Z6wb/olKVx3BCWCDl/d5BNnIJiWjkO2TklC0GkVKIEfd8IBpjfLaJXDZ8JV1MxMCdsNMNZxtG
 c3GdmsTQ9YN2a/XP90zEPR/91xDbI9Oe7uE6vk/qwDUFRF0v+J9SWeGVAAjQBlrOQrRHxfZePVt
 eYE7ahHglmuG+FMQQo0EQjILP7NeirQLRThW1USv9BAl6sjW1seVjWLJMMaNCMhV5mxxv1rkPJ8
 mKydXSWGyB0ldHY0+fGuvyMKFKVmPW9ysdtanp9gSfzCeLMUzEWTojfJf3qw9e+5VLeMeD4Pufx
 tCugmyMMWt9i/S3OnyzWKbGWXJbhYF/N3SiUVLRx1Bh1JsLWJgWPBlN0O4P8bFttUyco0Gm3D9+
 W34lKqR5AKQB0bT9dfT+p6vwIM05KzXFmWjFVeZzIyRuLLHZdR4hR6DZoPGMXiUDD+tsmwPa3BM
 Kd6RiNe7pzG4FFLifYg==
X-Proofpoint-GUID: GVefGOO_ErfKKBpM2e68oLfGxh6z-zfy
X-Proofpoint-ORIG-GUID: GVefGOO_ErfKKBpM2e68oLfGxh6z-zfy
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69ce0369 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeUw2I9XaFYL6OdlDaEA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020048
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101424-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6DF3384271
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v6]: https://lore.kernel.org/all/20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com/

Changes in v6:
  - Fixed warnings.
  - Fixed commit text.
  - Addressed clean-up comments.

Changes in v5:
  - Fixed poll memory calculation.
  - Added few formatting changes.

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 154 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |  10 +++
 2 files changed, 144 insertions(+), 20 deletions(-)

-- 
2.34.1


