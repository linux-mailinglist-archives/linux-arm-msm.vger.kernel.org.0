Return-Path: <linux-arm-msm+bounces-110687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LS0NLYkHmoohgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 02:32:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B88626931
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 02:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10A7530305E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 00:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7666B306778;
	Tue,  2 Jun 2026 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXvkpmD3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjYuBdu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D62D4B68
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 00:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780360350; cv=none; b=Z4l9cGou2OvoVQK/wpooHBzvw5VutM+l0SNX8K4nJBuqYpUVxPDjOSPup5uVITuqvT8wl+G/XhVnD7YGCk1dQu0VvTKoTO32wso/E0n4A7mlgU2Uzh5jN9yuSeuHM2/cGk/qirs5uwWQaPes8bYU1dx+hQEDDmBG7RaX76+yD9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780360350; c=relaxed/simple;
	bh=l+vWmWmCTg0/b/zROhsowEHnROsfUd+j1t20SyD2Nmc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rY6FZbaDoYHECKXeQdDGuCP54j+kxlNm8CWxK0bkLCCCZgTiRUup/g9K2CPnFsTnbQHrmktwHU2tdsqowSbsb4o0Pj7VqFbWGPTLMfMDEyPDBUw1FEf2skOQdkZtXI5I9g0A44AL4ZvSwkM/3G/Dab5PC8Jpr+nXeV+8X9HInO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXvkpmD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjYuBdu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651HNaNb622132
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 00:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ndv4vRzXPGgjMgmplv/bbC
	V6/16eX6AWssa0oWnTyFs=; b=LXvkpmD3YaEMEgzi9HXlV/4WyRMgT7lQawkmmo
	D0oHwfkMWWDZvTFZEKK/xz+EXeGfhT1CxJNBa1/S2exRGhTgsysTsTLiWHPbOA0D
	PG+HbwP7E54ZI/jemv6eeNV5qOCRKyaBCB5Pv79n9pNFw/cLztlt3l+p0breN+W7
	TCa92zlD7qJNuoLdrSMESuzO0zaOeU1WJ7O9L2lcSikvXK0pFx4myO0NLy412qfI
	omBJjd5s7FTLbg0vHW5G/ONOuKgj6BG6Aw+12MnARDNRJr+6hH7Io+57HlTFrxTm
	fwMQvqFWctmp/xerBgE51zyspXH7iH9NDbnfexfrHylOlHVA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954k6dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:32:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d8e9563eso4617717eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 17:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780360347; x=1780965147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndv4vRzXPGgjMgmplv/bbCV6/16eX6AWssa0oWnTyFs=;
        b=LjYuBdu1tJ5ZWorOhVwdLK/XCqc43f8bR43lhi5uN6bEl2se7HuvYg2LF1rNWJ0ImG
         VLgCWfjH7t39n4+Uolr2/iVJ5X1LYUE1sUSSdqOGdE5YU2Su8mzCFF6AJrnn/oFFaD0l
         cEcIwqHusZV5C0edoG3K8A76QrZkReYpngEnCEW37CuPj05ccwRzrWjDBWNtVcS+oB4e
         Y6RLEMq4z2gEJlRAvPnrZVyKCdAdpVXdheWglm9Va07VZnZZqqDZr88bjIpyvqzTqmE6
         XNfHc5+iG65ZtEFx+LnANauWG9DBprTrq6lfnvyYQ/s5A2A9B8gMxmcBmtZ57VV5z0nf
         /TTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780360347; x=1780965147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndv4vRzXPGgjMgmplv/bbCV6/16eX6AWssa0oWnTyFs=;
        b=Mi2czKgtbVUpl0RXHbsY9QaTBNgEXqWpZyjJ1tC/6R58S8HSYG3ebnpYzSXB7NWIOA
         bOdyzOXKWsKT/+eiDNt0YZHyqOX00BSANhJMxW2xzdL5vHZqXKuRuxwYuFLvFcrTTkCh
         9tH6RYgH5iW6aRzXX3+4cgYQVpIun46E4148YNJxoBbx28ICge1euz1NyDUywQW0GMnZ
         RM3ET56xtMG8vj0fI41Ukgn7gRp6uHgUHr9BkkC0vALIVWmg0nMhwS8Ik+Nl4J4oDRvK
         AaamNR5GvIBHpKq+QNZ2ZAnHphfarT1glow2fypuag0ZlZ2uyaS1wcIQLTbGVcXA77bl
         5dHw==
X-Forwarded-Encrypted: i=1; AFNElJ/DHu8p08+AREXaXoGAwF1Ql/wc7coUkz+sqOiR8oewOMlpLzECbLdgo3zsqpsz5CLrLY9XiZdRncgz1Kl7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi/45ZwwOqUUK7DWDlTetDy03fIksJHYU9GuapTOv0zV3Ye7dn
	nlPBGpcb8wkVun0MbmmpmzMXYlMYvnSaxVCGTwacZoXRB60w3NcRz5zJbEkbxZO+qAj4XnV+Cpm
	if9mHqhzOFAiGgvmw1Tafg7SKtJkiEICyg/GLNTOVzsTL5S4/EAGhLDUOgMdPVKaJkZz2
X-Gm-Gg: Acq92OFEHPtajlBI4aUfhYkPnLWzJyWbXonOGdnMDtbuV3uxc7QjuD9HA7X9hcNN9Wc
	LyMQlXhJHYuY1rxj9+a4Xx19Slz3DpT4xjG3cK8H/QnqxvnP7JO00SJ/Lms/qR0cT4ZGlq9UgAJ
	dF98n+pPf5XD9dmKw4ty4jwErzd/mp9Wh9xLv1FgQI2jKLgkpdq572HVfWdbaC2XHSENzfxwJBk
	Xbkf/RzLgIXZENV0NDXgf8e6DU8MoCF9IKpCpOcxm0vaPopsrk2efk4EZN75t61Cu6gcUavjyXx
	iWF1z6IgCMAUKblAni8LZbLzFwHeXctntLfhQ79U5GOghU+wsqia647qhLKuOGIQac4dsVfokUc
	oTErTl9cTWCIYHZZ43a6j523xoMXCieBJWAJN6zajRjgzSwf+8I0xv3nGsaNSrg4gzgHWj76dI6
	69JwauRJkmZqs=
X-Received: by 2002:a05:7300:5b89:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-304fa5ee22amr7391416eec.17.1780360346693;
        Mon, 01 Jun 2026 17:32:26 -0700 (PDT)
X-Received: by 2002:a05:7300:5b89:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-304fa5ee22amr7391397eec.17.1780360346174;
        Mon, 01 Jun 2026 17:32:26 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed563d09sm10070412eec.15.2026.06.01.17.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 17:32:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v5 0/5] media: qcom: camss: Add SM8750 support
Date: Mon, 01 Jun 2026 17:32:19 -0700
Message-Id: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMkHmoC/43RwW7DIAwG4FeJOI8KSHBoTnuPaQcnmBWtCSmkU
 aeq7z7SqOulVXdBsiW+37LPLFH0lFhTnFmk2Scfhlzot4J1Oxy+iHuba6aE0lIq4GgtT8dxDHH
 iLkTeYZ8SDwNPvam14FpAV1kqwRrDsjJGcv50Tfj4zPXOpynEn2vgLJfu/+1ZcsGhAkekqK2Ve
 A8pbQ5H3Heh7zf5YUvErG4sCCnL2+9Vm1U2SFembreG0OITo7wbWpjXo5WZdR0YkAi6g/oJW93
 ZPNxrtsqspBZcVarOWfmAvaxbjnQ45vNN66pZTynh9XxN8Rf3jTjgiHt/W4ZcfKrBKUAE2D7ws
 95iIr40/NQUA50mvu5FbXP65RcnpqZgRAIAAA==
X-Change-ID: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 6Q_E5NcEcLuoaPATKqfWugt71sXaTD-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAwMyBTYWx0ZWRfX+/qndD4Xi39A
 /4XAQR73Svmc557sm2SJWVTW1miP4u8ZdXqBudDvhmA9xTef2AkXyx4Oz/L2aaChqmW5fLfmckm
 cPT/mPfwBWHt8LBwfjKO+DuD6TcgV8qwCMpqMMA8b7qP7xtqUxJESQhdoWsw4VGSlwZzppEbErz
 b/m3pzldC35xsBkrdzv2TclnLNPh+kisZG+GtjVNGiWImnzFXh7+3sijno/tqMEBuSbeFIRObw5
 rK3niUKA4RJDwMk4vJd6AlNsXDBEbVjTIkUjT7K84HbgnPZyHA1U/Q2fp1kCaqNN3bitpyal6bt
 5xmctBbpxWmkrWuMbvQplspUjuZXFoU7xCAS/S69IrxFo4vvQFELncsVB665iup6hU59h146aVL
 TEQJNz/JRo2KhPoqS1yEaaSKlGY3aZkZV+u9HP2cRjImfaU/lpzIGue0t06D5cc0LW1pHPa468a
 lNU+KPeQ4u9Un/49New==
X-Proofpoint-GUID: 6Q_E5NcEcLuoaPATKqfWugt71sXaTD-K
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1e249b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZthKqu_aCWk3wB8NWGYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020003
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110687-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80B88626931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the RDI only CAMSS camera driver on SM8750. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

SM8750 camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v5:
- Add missing CSI2_RX_CFG0_PHY_SEL_BASE_IDX macro due to kaanapali
  series has merged it into gen4 driver
- Link to v4: https://lore.kernel.org/r/20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com

Changes in v4:
- Update dependency to kaanapali camss v14 and rebase to resolve conflict
- Link to v3: https://lore.kernel.org/r/20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com

Changes in v3:
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v2: https://lore.kernel.org/all/20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com

Changes in v2:
- Rebase this series due to conflict - bod
- Add module descriptions in binding commit message and cover letter
- Update property names to align with previous generations - Krzysztof
- Update the vdd supply names with 0p88 to 0p9 in binding to keep such name
  style consistency - Krzysztof/Vladimir
- Add missing Kaanapali dependency - Krzysztof
- Add regulator current in csiphy resource due to interface changed - bod
- Make csid board level code style consistent and add comments to explain
  the differences between csid full and lite configurations - bod
- Remove redundant initialization for empty set in csid and vfe - bod
- Remove DTS patch due to conflict with camcc dependency. Will post it
  as an individual series.
- Update vfe commit message as renaming work done in Kaanapali series
- Revert change-id to v1 to avoid increasing reviewers' workload
- Link to v1: https://lore.kernel.org/r/20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for SM8750
      media: qcom: camss: Add SM8750 compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.3.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE 980

 .../bindings/media/qcom,sm8750-camss.yaml          | 433 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 443 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 357 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 1249 insertions(+), 4 deletions(-)
---
base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
change-id: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
prerequisite-message-id: 20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com
prerequisite-patch-id: 03f9fe5d9a18559572b9a56c3b1f0fb86109f4f2
prerequisite-patch-id: 5fbe09dec4a5448b016a6bd1d36473727bdbd485
prerequisite-patch-id: 60fd384dbeb9f837b0ac09b8900f82c42c14f914
prerequisite-patch-id: 23a9dc6e6230cb4453df4261ca37653fbde28b69
prerequisite-patch-id: 7a42e3280f6aaf17df14d5afbca9b29f34070116

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


