Return-Path: <linux-arm-msm+bounces-93720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJsbMrx0nGmcGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:39:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D2178DD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B603730745EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25B2F616A;
	Mon, 23 Feb 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1PJ2zvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhtdJwJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C92ED84C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861080; cv=none; b=o7qLwPch91Ls75TI+67mUjpGu5zsrzNMlauZob6LDUH5y8fo2B7b9SKhaSsFeLSjcxt5Tp/SLN1kPAS0DpqJ2vmC09sX1EPi8dDEI8B3IVAWEfH4mf7577k/Kpx1a1+GyzNX4+T986UwfvbTCQzTffKtD5R5t7ngTD8kklrAEOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861080; c=relaxed/simple;
	bh=izu3s6PcTKtfnkDe9CsfJ88uAg6CxN4OlUAtbFieQWo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hOQcZUCY4LFqiBhLg9SDBCX+X9j8bBXFQFDV/bscIjOrNK4lo79szukC3gj2bFkDihhDn265LyCuPejECD6bUW4G6NCF22U281T7chE2n+AddpL4CDqY/7KApnI9VpC9O6HrGjDfgsHadTC4+YTGBx69AF7ZUaIwdIpY7hkepxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1PJ2zvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhtdJwJV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NA98xA3552830
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uqyugOZL2keWbJIACQLA35
	hgWndQNiaMs8B/9AHMBaE=; b=k1PJ2zvdMrisEpcD+sM7fqXF/6da6I9qpaCfHV
	WI0GUK94GxCH13O2udYUGSIeA0vIQEWMlq3VZqtH8Jj409h/2vL1cgQoMmvFg/d8
	AUZCt7b+J0ti10kTk3F5ofrU6H6xlQzKNfinaqBF4C/DmODdQ4QDZwbLINL6zbbs
	V2fcrhcrLxjXDO5Yi1pkHTco3y7+0C6koGxMHrQELIMfdq0MrvSdmxirYgdmByu+
	coalCXfrxEAIyfl2Sf04JlN7eQmAavX7qOYlFd8prxROjIU87OUuxqynx2DKaZI/
	q30jrGdMllkH5JFxadbV31mD3zeLc/EW8+dHQgaIPljjd+mQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8n8s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:37:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so503064785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 07:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771861076; x=1772465876; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqyugOZL2keWbJIACQLA35hgWndQNiaMs8B/9AHMBaE=;
        b=WhtdJwJVLO85bajYZH9rNsNvEkjdjnEP1kI0V//Uljfk3jkJWXVxcrcNqD4zf6qyp5
         3mJfQcJorRn1ptrPuU+f/b0PIsj2zyTLWR4auMuPKvDh8Qk/sHd48ssGj5/X21nz2/kJ
         l8plUA6Wy1t+GylgW9QfcDsX3cpQJ6Ub1X9JHkxaqVEw8MgFBAZZu/vW5/0ZZkbDiH2b
         2NrwYURhQHQru5ApnDOlbTgR59IjwmqjWNDqFmyheLr91sS/CVSnP8C3mxkR6e2aiD7Z
         9W9PXe+pTmvj9qKKt30TFsZEY0zfYohgw4TzFuRGUkaFwz/qQT2XpqfOVTZXaEai5cXL
         +BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861076; x=1772465876;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqyugOZL2keWbJIACQLA35hgWndQNiaMs8B/9AHMBaE=;
        b=LcLewIMiu9kueAeozIDvHBvyy1p5SQgiWK9cYWcaXvjyk6PQNSpkiYx8wbgxbMTN+d
         zlbBG5zng564Oe2pX/hPDatttVqFKpZEZHFDsUS7oh5dJJANRv4z6aRWLnYgJobTxhAP
         1q+q6xbC9eQKvkbMIeu0l39FQ4xDVNNSx+Pho2NSzVz73UVa/QkLwFqc+CVlYI3EIzZF
         uEAEM1CsYJkX55OU8wDKb+GxFxtvqdZzBxnDvvC2Ig2UcqRv3QlW8sC5FV/xQ67dt3KP
         IqP5OvEIiPplIWllqMRiEtcg62y0wSk+IuvD1GmoUHg4B6O9Ku1Wp7Zdl+/mYwZVmHeK
         j/vA==
X-Forwarded-Encrypted: i=1; AJvYcCXMbyqoj87ApzU9Z2+JTEO/pHN5SIYeffZbqw7oJtTYsXEHUWRuCBZANOopp+M6Nnq/z5rznoQclTwOA95s@vger.kernel.org
X-Gm-Message-State: AOJu0Yz59f8Y2o87v1ujdadXtYYZWkTo43+5JZkl/Tha6nZesSwobbT/
	wSqH4BHR9V65O1FA8zQRVpiydh94xSbbkkHRKoFc0Xzf/g0RK3+2yXCImi6z5Fa3dpq7hdLeFPZ
	IrBdduivdM1iDfT7ML8fiKwJV2vxFR5mp2esaw9h6RGtyfP2FEUwkN6uh9Opjjb6g8TvX
X-Gm-Gg: AZuq6aKvona8oyAc1cMotKpxLWDveteQpNwqJuG0nzo1Qc1VGr7UpuEEmv9rPd4mp2A
	tbVzcLVqY0XegL5fcnr55mQIgb4NcWkDSOvzi6tcwovwn/nrvRP8CCJKVuKDSpR2pkIyafHYxBq
	58LDSzip4/IzytuAGaXbL7cgAiAZf9LmqemDxyqkCXkJSRvhojkDzx8l6WH5d1E6JfQI6Bo5HcS
	oDq+CYvr2ro5aDQIJ+14r0ju/+MyeoIDQ1eIiuJJ9l7apqghz0ckzWUVG4INzwSqgsDsuYiyG6c
	4q8lIN/6Ik/T/gtLYb562Yltkk7TLDSsiAXpfcVVonp0pmWM1JNNiyQvWfw9MGinMn3E7Cne/Zz
	Pf8OFLYgCDaQ07FuqS2RqyliQrcXmmQ==
X-Received: by 2002:a05:620a:1915:b0:8b9:cf85:40a0 with SMTP id af79cd13be357-8cb8ca8709amr1361226785a.57.1771861075612;
        Mon, 23 Feb 2026 07:37:55 -0800 (PST)
X-Received: by 2002:a05:620a:1915:b0:8b9:cf85:40a0 with SMTP id af79cd13be357-8cb8ca8709amr1361219985a.57.1771861074782;
        Mon, 23 Feb 2026 07:37:54 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c96csm21880679f8f.30.2026.02.23.07.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:37:54 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFT v2 0/3] arm64: dts: qcom: glymur: Add USB support
Date: Mon, 23 Feb 2026 17:37:42 +0200
Message-Id: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEd0nGkC/4WQzW7CMBCEXwX53I1sB4LNiVMfoOqtQsiJFzDKr
 9eOShHvXifhRqVeVtrVaL6duTNC75DYbnVnHkdHrmvTIt9WrLqY9ozgbNqZ5LLggmuwgWCougb
 O9a2JHoy1EKkEin3f+QCF2JaF1ZbnsmLJpfd4ct8z4Yt9vH+yw3KkWF6xCpP3U+ZxiIkfntoGi
 czMT+9MdMm15GstNpnQKtd6CwJMe8XaDRGzBmtsLf7sO6JsiKZOPzZZGpP7q5fQEHsKHk1zHPP
 jEubo2uA7G6uQWoBRAQdV4RrXSmNZFn9al4YQpoMLu1VhUeYnJcwG+Rz04ih0/jbXO4o519Kky
 P9tchSJr5UtbK629sTFK//weDx+AabL3OHDAQAA
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
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2426;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=izu3s6PcTKtfnkDe9CsfJ88uAg6CxN4OlUAtbFieQWo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnHRMUa5oSlQnScH1CQi38A8B5z8sg/cUcp4B5
 9nQ5U5ZbA+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZx0TAAKCRAbX0TJAJUV
 VqR7D/9CrIJAY/FnAd9O2DxWIcsl5wBLmM8LFF3/VgT6zx8NK31qHFeqoaKOcMV91za/daj83d3
 aZBzXy7ni1m5jTzNcDaC8yG6I1n2cOKl5cKOFCQpBlpQwqw5mTx7jig18g8V0kj13TV0gVBZ7cG
 +I+F2+9z+z3LDVjjytOLPRHdI+zI4bnw53X5NrsoIdcK/kBvkZtZiFGdLGp2/j4Xctk6+cCYMaK
 hBK4frYxXzj3lQMcfYtOuC8C9aNCDrLOcc2VKoYF3PD8GM9Ds4iwHFcTcHZN3HRDaofvr0pznXa
 pz0yrsW7Mp/LtQFx+qlg8M6jKLZ4rcuj+wqBQQHf/9CFXccAXAexTW88gIfZc05mkkBlX3XIW1s
 539dXBgK4HcEkE6aecA5LHsIAyCGD85SM8XSIy72fmq4OQVXhLt12LiuebdLh1zZPfHIv5yi6gT
 Lji5/3crm/mJNsmM3eUf5MVQtXuoNJ0ibf7aIIDasOOH/l/hYvYoO7qM35M1x6bcp1/VcH6yVko
 KJN7m4mqIyqBiGT4YIU6kOeEW/27KIeWwkwI66nVbTp06bshO3iF/2N1hm4a3JCdAxUhxMRenYg
 bazXYJZNMfGwakU17/Ac2/23Zn2BkSKKC6xAc73JxkuxMEk8oUcZnVFnWyyIWFJKzMOLVS9E9Ez
 DA3LQ1IPXU4ItkQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: HrSqnEFdNTlMeawaqEzmlZjWPKS8ChGj
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c7454 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fcrENYw6Eu_lQ1CEjacA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: HrSqnEFdNTlMeawaqEzmlZjWPKS8ChGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzMyBTYWx0ZWRfX99lcCBM81u4Y
 pgXpreP+LKKMWZfZXnwC7A9okJ0T1d+Wwc8dLmzqxrL64Ofqz8uo7nesIkxnYyNhEwL3uS7xk7A
 mIRN5ZEQ5yIWSwxAhPe27THh/7XgCGOrDP6oS6uwolAm8UNxqGb6B+SwEJN1/Tr6X5p/dFyENoa
 3uCoYD7j7dZBAklUIkrbqoX6z+S4xUMU/wbC2FLe/BSN4qfI5QoryFwAtGtQo20GSVoiyjlFtzo
 kUMye9otMz7PfoLSwp6HLA/f+QaFuzR8j6LZQnKjfBY92R5stMceEqAsMnrtF/jszHC0Al6vHts
 d5NuxiSHb+5UK+VnUpr1eBrK1iqW+j9/m856aUylKnJ2ikZi+aN+EGEMjozM3UnNZJ/0UwVE+AX
 aIB1QTZg9McQoCi4W9Ea0G/CpJhkhB08LgAKuLIgnnxUYPdWETFs6Afbte+gS+Es0rjiydbU+RG
 XV0eLWjQxUTQJuRgGiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93720-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 515D2178DD3
X-Rspamd-Action: no action

Add support for USB on Glymur SoC and its Compute Reference Device.

It adds the usb_2 controller on top and addresses all comments.

This unblocks the upstreaming of the display support, since 3 DP instances
rely on some clocks provided by the combo PHYs.

Sent as RFT since the latest tests have only been run on a remote-only
available device.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
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
 arch/arm64/boot/dts/qcom/glymur-crd.dts            | 286 +++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 691 ++++++++++++++++++++-
 3 files changed, 973 insertions(+), 6 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
prerequisite-message-id: 20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com
prerequisite-patch-id: 66643de4d7142692ceee6ab78d4c1fb446182123
prerequisite-patch-id: 056da4cc346b633ccf7e12536839eeefa9469b78
prerequisite-patch-id: 3d3c5004e30407229b8f6612ee2c56dd6171447c
prerequisite-patch-id: a4ed5f8f3d10b47b0d1daee2e0dc44090c13c01c
prerequisite-patch-id: 144090e55a19a1479f4b35b75f9e5b80a9b919f0
prerequisite-message-id: 20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com
prerequisite-patch-id: a9ccb06216435308c295e2de9adffb79060439cf
prerequisite-patch-id: 1e8d403675640d7db68a4c0caf28d1b1be895e8a
prerequisite-patch-id: 09bf515a2cd6bec5b21f15b18bebdb172f4b4a57
prerequisite-patch-id: e88699eb550ada640f5f2f5e4f432d6a3ae2552f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


