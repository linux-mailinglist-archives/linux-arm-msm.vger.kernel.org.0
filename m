Return-Path: <linux-arm-msm+bounces-93191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IZ2JghwlGk0DwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:41:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A7914CB5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D04F3068256
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3AD36AB5B;
	Tue, 17 Feb 2026 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5i06TvR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpUR8Q6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00A35893
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335553; cv=none; b=sxsJ69Dtr0Ksu5HMW5fFj9Z0HMookhZVVo4TnL/QqISEtXy7zJTu/Sf5GBjT4Ttbbl4FXRmn4qUy/0U/2VvxQo4THByiF5orWplfFIuLbfqArhENkjbptKNN/D3mg1DzF0l8epIj1NEPXMkzOIDdXC+1OV3gxMH1SbYHzo3d1Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335553; c=relaxed/simple;
	bh=pwbVjbdpL6oPZnzkfrQpzxeKMRA5fbSLBXKafFM4W7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TWk70kRvvjtc4XyiAxj/tErKoYba9W53USX1KEupse9krAUXMhfQUNo7i93WpSjeBBkbhFS/NKg5Km25WMQtlnsuV2ZB7nWwc4tIzgt/XYWCSqpVFpM58DC5YFCcEJcMAMlLdWva/brvtuN5l1qZ1XZZvPNBhANH3ZkA/vAtRp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5i06TvR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpUR8Q6A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H83iPI297034
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BhKQK2oMgMy
	TX3pGdWQYzychtBQt+y8zRLcS1x1LvAE=; b=a5i06TvR4wBVOb8P7ka3jPtnGgW
	hJlHRTlxIH1q5PaxBi2xKwPtN/w8OP3jCjRWv8Y3qOrFP3fuCY2Qegtjm5JpYnTE
	hc3eVw1C4N2oG+Wkw4569L+mnjJldSEAIpEWlMdrdsthvoXEBZphIblpRP2HX4ih
	mswr9i5NEZHUrjGK4Ljjxz4FqqkmE1tr14p+029VFeeEPVNNhae4zT5kj6uWAvYW
	xkmJG1lLbzJou8QChpAinH/Mwha4F3BDjWhe2kt0E7pryNgsIOLbwNFxOp9E3Gxr
	qgDCCqa27HQo4PFB+p4C/QhqXq4Ern5NESEpYJQvesmoc1OhdBuqlLV6ncA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9thq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8249e91bcfbso1721880b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771335550; x=1771940350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhKQK2oMgMyTX3pGdWQYzychtBQt+y8zRLcS1x1LvAE=;
        b=CpUR8Q6A0+ySqNYp4AkyubgM4J0GjX+BUHm2W3cFG9TVih6YEdcN/3i6nhXjBH1bmK
         70YB/tqhtFchTmv+oL9JXI//u25gLsncFAZmbtRxRdCo+HjccJi4fajkX48BOpWc+tda
         NvxJTMpc0JuRJrjbiACk0vLz1/rz8Jb1BIbg4D+QvxEjC4ColNnU7JmKfpWY2LLIu2A8
         WnvAuLGEv7DxWw+WQHzx2TJOGtBf0Vtd7vMKP3fCL1s50h9CkExAmJ1SjcVF3MQ6Tbyf
         fdPPO6T/HNa8wkW5Jp1UAAWXP5kIek4hNFMjC2X6vWA8y6cR3iFLLyfhHunB8qHhSasR
         pqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335550; x=1771940350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BhKQK2oMgMyTX3pGdWQYzychtBQt+y8zRLcS1x1LvAE=;
        b=h4D2ZYXC/Y999cFLfF8EznuCOPg8fHCzY15MQYn5uJZF2YWIDOzvYSTEaS54iQxGzb
         Iy1vAmF1T/mS94kD5+EMHtglaHHvSTF2agwfwIVTR/5D6Xe14uHxB9DbOB4GXdshXjZl
         aoIoOczWYIjS5vmXkGgUQponim9LLu5ixi/wCVqPuiMsNeBgA14N0JZQv8i/4xrqAHLd
         zDMZiLTIYDf6YoyYXWRKNTM33UuW6BXyUFSPeI5ZZX2FaRovuK6xRWI1QIcgYstB8QFM
         ioDTRvQj7cuyrzA4EjpgJHRCQBdmmtc39TPoEqGJ9ykPxVY9tYHaBxHZD+lL0XS/ZEhb
         1pnA==
X-Forwarded-Encrypted: i=1; AJvYcCVrjMaIN2w3DJP4PBU/opEH5KwT1P1MzEbK7HxujSprH6bUsBzODcEnUngTR2EpJl7egqHTXQOohJ4u4TlI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jfDd+F4WBlelY8gtNcLUaGLKOJhRpjGiU+OThgbJ4iYOiOR8
	5Ds0p7F1B6ozHgJJ1A1/l8ozYJ3xhNoNtW5qdP9aI2SXIWcT/xrM+sjq6qVmL/q3WqdM3Hf6Ghg
	xUTCQ4bDTEwb/bNE1SsfMAbutxj0OvZVOh7GVxqbFEMc+MgxFMT9eP2vepU0Bt5hkt38h
X-Gm-Gg: AZuq6aIxcOWgAzyhnZHrEZUJHXIzPcmg1x8JY0abURoTSWrY50+t/NSFPC82bOOSaH4
	O9ZG5VHDX54hmHm233kU4Duiqek9/4wp8bZGl1TOXslNrHXXH2AwsExgxUSFl10oNy0W0qT+AI3
	BWD0/40BCPy6egbk30ictqwACN89GrRAuZ7DPxh4UWUuY2cXROWe7uBHUKPRVOetYBQl1JQzpmu
	3+nLfxNCLXQKHP74rqGpS1MFxIfxupz1Gpq1DsdbhZNKiiRdwguFTEmfHLTNJSAMtqt//TJUTBd
	N5EkYtioQjeSHEf3Ov589W9D+2cdiDxInQB41qRk0yXVuYp0cOHeETqfB55ltseXFDyD1CP+3uJ
	TmJcV3xAttKTL/FfrI9A0TuiZgXHaPyil2DIDDAKeuyM9Jrx3Rmmb
X-Received: by 2002:a05:6a00:e84:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-824c95e4266mr12349197b3a.46.1771335549906;
        Tue, 17 Feb 2026 05:39:09 -0800 (PST)
X-Received: by 2002:a05:6a00:e84:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-824c95e4266mr12349176b3a.46.1771335549446;
        Tue, 17 Feb 2026 05:39:09 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b935c6sm14633207b3a.47.2026.02.17.05.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:39:09 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
        yang@os.amperecomputing.com, dev.jain@arm.com, ada.coupriediaz@arm.com,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: insn: drop NOP from steppable hint list
Date: Tue, 17 Feb 2026 19:08:55 +0530
Message-Id: <20260217133855.3142192-3-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExMCBTYWx0ZWRfX3FVOWXEAPoAe
 4CpD0C1Ik89/9bz6k9yKRBJ41xsyCx0XnzlURay8puZHa+uT7pQQlQd9Xr1/axn3l21e76+aaRg
 Z/uMm2Kh9L4UQrHYOi4kzIOEumSOoHflalcQddmMsPHdvGaJ+S4o91OoMh23EfCmLfKZ7wsRQEl
 N70CO2rQRInxc7/g+gaZ52+dTi3jI8YUjbz4HU59HlpB+7xNrdrBlFsFUMTF9tvQTDaGc669/YS
 1LD+luB8NnWAmO/ZywHPU34aOJ7gLZBEd0dplyTc0qgRN/j10VSMacNedx/6XaldaxDsYnrxl73
 pdzUAI+P6MW/kyctKmgmBWAsZMBDOKDObN2JiADG2qVDGEtsD3knKLCQCjGnqE/1OQAO75jb1TP
 b4oR4trQ7zOSYiWT1cLT28V+z5g+3NiH6OLP3UoeIgIKLVKhNjWZCJSrndgWII3cZO6KNRG216c
 IIMWQmLydgetzcnqzeg==
X-Proofpoint-GUID: 2rcpEORImloRzKh40CZTTXbX6fcWt4w3
X-Proofpoint-ORIG-GUID: 2rcpEORImloRzKh40CZTTXbX6fcWt4w3
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69946f7e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=OUhaZ1_5ODAiWoFFvy8A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93191-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[khaja.khaji@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08A7914CB5A
X-Rspamd-Action: no action

NOP is already handled via instruction emulation and does not require
single-stepping. Drop it from aarch64_insn_is_steppable_hint().

Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
---
 arch/arm64/include/asm/insn.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index e1d30ba99d01..9429f76906e0 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -456,7 +456,6 @@ static __always_inline bool aarch64_insn_is_steppable_hint(u32 insn)
 	case AARCH64_INSN_HINT_BTIC:
 	case AARCH64_INSN_HINT_BTIJ:
 	case AARCH64_INSN_HINT_BTIJC:
-	case AARCH64_INSN_HINT_NOP:
 		return true;
 	default:
 		return false;
-- 
2.34.1


