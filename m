Return-Path: <linux-arm-msm+bounces-110221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKHrDUhCGWqNuAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C260C5FEA1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48D07300B77B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4C3AA1B6;
	Fri, 29 May 2026 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c80OmPuj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gjiu97Ri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD5347FE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040112; cv=none; b=LA0czR0btKmI9/miXqEb0Koll3JkYZA0s9XEdMYkmNu+35oiACsXBN0M9NLmBLo2VcubQNSWvluKhlGRksAwQSKSFsIhlK0yolep1c0MME7/5eUEJh2cckmUfYjGrEfr9xKEQyUcPfvpjJn945kTt2qYG4fgVoU394wtF9HtSpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040112; c=relaxed/simple;
	bh=OdC1pr9K/79omtq2yYuBcMMtbTIbi8aczP0jFHkIz/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=llT+cUCbanHiX92Hs5KOvridP3Ya6bIO41k8sn559+om2u0ldpq1B0YQ1xX5qOp0s9/B10AVm4HpE0PBTXH+RLVKOT7jYqYLQrVtUaqgLCZUES54Iz3ANYuuPiHLwTG4iZKDPDSytLLwrHM7Y1ea2YJO8ubHmQkBdHnCqpO7f2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c80OmPuj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gjiu97Ri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6OqWo1386477
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m4DxdDgpR1HAqzUbSyO93a
	/WlyhVfSKF9EsQbyzuJB8=; b=c80OmPujBYFb1BF2Nu4bw8Vf5eBQXqfIbBhwOa
	No0zgEIQ+gQBhGzKQ0z56tNfmneqxfz+oPG+NmHZTCvu6dktl8dv2LmeIYx4sX5q
	VgTSYMag7VVJAfn2IaqjesvmHy/ZnXH7sCxvKenUFqcf4HUsomf6UT66uTEeNN7T
	SBcdIXH1YqUDzgmycjBXoO0OoMYT8Aud6nDoHoVypoJAa2uAOWDjWOOoO/PUEaKn
	AiD4fLIICNrew1/+Bbe6nfGLKuBdoxLcg+kLwSOX0FYZo1wD+orbK2z3p1tt7vO7
	KksilNlL+r+m5hY1l0gbiKplxqt9LpkAY9bKuWAGkoIC0V2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumtaxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7378ad0so148376085ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040108; x=1780644908; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4DxdDgpR1HAqzUbSyO93a/WlyhVfSKF9EsQbyzuJB8=;
        b=Gjiu97RiJsR1OC6HP3zKahppjCSqmVfIYoYAW43cdcjIT7zdFDHZ4fACLXT9KOwH84
         +8hb93SsMErSO7hz9h+2ulKitCV2b4RRM18Anoh29QiBHpA8YMJtlx5oe0Pf4qsCzn75
         qS6ePSrwyTpdUCVRgJ5q73N00jOq+qkwvJkQNhcbjMoF33UTyTXu7BcNH4iR4U4S828X
         Sm7CledoQNAdS3ltlRFgb5dx8LcfN8+VYL3NVQNiWYqEYlB3RLV1Zp6UAidasblx/cWZ
         Jhbk5oyTY8m80OYDYbtB3pUBisXRb5lKj3P1v8CXSpS4aP+49wqCir3muCo6CchxZ4dk
         wezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040108; x=1780644908;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4DxdDgpR1HAqzUbSyO93a/WlyhVfSKF9EsQbyzuJB8=;
        b=ZXJcFgFqZOpQ79k+fXWueNe5Eh0pS+AKTpgsxQ0B1a37Gt2/i7N13Ljm2Sedkps6xt
         GZSMK4jme1SZxldCpXU8CdyRg0CJUlLDiiuqCrwZ2ObA7ShxuwBm72OsAImpaDYpd01N
         h47oSzBWkZlKm7i5DxeArIHK+xHh0Re6W16ZWNMhm0WZsbyh0FOVS7wCVYorbES+fbV0
         IivhA7LeF6poO9MY3GQL/CnSZOw+nt9yLGC4YT+Qo/EJsTdl3J4IaTKoNsWP5c169Fqy
         FtV4IcdWi4AtVSwLvITprsDdyFnZafPsbNZMD0oa4izn88X5O1dTyu9qx7fpLGpg2j7y
         I/0A==
X-Forwarded-Encrypted: i=1; AFNElJ+QcutDIrA2kVFf9icZB/e7MlamDTTucW9FGoMdd3/iQYLO1PJtvkRuV+iCeL5KIAFXlWxR96PvwJkuopRo@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzRbzgcRv3gnG9QTUQKiEnZD6ar/T8j+rvagc8EpYM+QwO9KZ
	dUnEdOqU+gS3OitFP4Yrhi+J7mATyE/CfEDLCsSWGDp9EBoO5UcF0Xo8VhhNP90xTiPq+Syx5ej
	/inw+vkWBvwaXX2t7i7tefS2vdh7RIC7m81LFcM3iMDbbvOrrocd6YUJtUxtfrmQY4GoN
X-Gm-Gg: Acq92OFrt+mHtciSL2k+FWJy2EpwKDPRhvjI9H4ey6BLDygfEduRgQE8BywCs0IQpqv
	0j2eVRp4eOVgr7LuCOmgnwOWvBnTD5SMDv4oEPrjI7lzrxaGz15ZcTuiI54fNBEWQVe2men0bHJ
	qdzPHj2dXTwjRy1iqebFaxwjCRde2SG9iLElk9XzFDQVMurUZt5oEBTYTsYmD4eIqdwjUhpUghW
	/ssCRjdWMrzkTZ7kjDgbFsr7AeOBNTMasXJTaRLosfdoBkdVITQ5XM/1hVcLIKQGkGWnhZ8LXFC
	Ee/nbKiMlT8TJDCpU3D2rwghsovotuf9gyPp3YTiahs8HrouYvZTQQ3s9lD7T69ROHvEDQBj6/g
	s5H5H8tQUKSkYR+eU/CSkATBswjmMPMjbbIwnxsdgOffih0dXt7l0AAeCq8ikAOyCIkGg0uOOks
	uukGKL/coynuawqBhVoECv9JZEZo1hkmM=
X-Received: by 2002:a17:902:db11:b0:2ba:bfc:76a8 with SMTP id d9443c01a7336-2bf2063dc62mr25473235ad.16.1780040108136;
        Fri, 29 May 2026 00:35:08 -0700 (PDT)
X-Received: by 2002:a17:902:db11:b0:2ba:bfc:76a8 with SMTP id d9443c01a7336-2bf2063dc62mr25473025ad.16.1780040107593;
        Fri, 29 May 2026 00:35:07 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:07 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v8 0/5] media: iris: add support for purwa platform
Date: Fri, 29 May 2026 15:34:57 +0800
Message-Id: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKFBGWoC/33QS2rDMBCA4asYresweo7sVe9RShjr0QgaO7ETt
 yXk7pWdRbyouhGMkD5+6camMKYwsba6sTHMaUpDnwf7UjF3oP4j1MnnmQkQBgQ0deip+wz7NKZ
 pP/T703X8opoAQAskaKxn+eppDDF9r+zb+2Mew/ma9ctjk3U0hdoNx2O6tBVK7UVU1pEnashiQ
 IcGuDFo0fqA4BC502xb1VZrk5S8fkTMyYfBudrRMa++QQAPERv07azYknFI02UYf9bHznzt+P9
 dM6+h1hKd4hANqPg6TNPufKXPJX2Xl9WdxdOSYAqWyBbqSBYIqAmyYMmNxUtdMltdtFGG/F2uc
 QVLPS0FvGCpbDlCq7QWlMGCpTeWKHXpbClpIzXGk1C2YJmnpQELllks60mDDkJ2pb/HjcVVwcL
 FQiLd5XOR0x/W/X7/BdkqPb0OAwAA
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=12464;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=OdC1pr9K/79omtq2yYuBcMMtbTIbi8aczP0jFHkIz/o=;
 b=5NcQzaEmgU+L/6xMEdL1R3Lx5J41i5jmLlyrB8L0qe9yS/V99FBtEB6t4LMXsVC8eynLGea8v
 83g7n75Pjm1DJj6D8DKW4Gn1TKKnwZwfAJvlit/FCWoWM5tMLbegRG+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: XX__e3UfMy4oi3R8AA9emy06h26u2ZHk
X-Proofpoint-ORIG-GUID: XX__e3UfMy4oi3R8AA9emy06h26u2ZHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX+vsZx5aPvijD
 N0L4eE0y/s1g2imG7FwkYs7UIPbkB56RN4Uezka8e31v3fGzCy4PAegrO8B+2wKv18WoweKRK+j
 0V5YJLyK/EREkPniOs7dSI7SPajgVg5a0ZaAO7ntSCuBnQeJE2MW11m6TGFcEbsor7j6q4jEqlx
 vVr6kDQq1rfc8H1En9OojQY1Ykz3NTNQPqdRoDMgc2t4DBfG4XWI3Lhyy1YKEod0zZN8/A11SgB
 jklO97gn2p/eLTMucjO5b7bkfo7YYv0e05P0wGY/MX43VHFGGzD5s0Qvmta0R2/bgWziJUltEV2
 aCMuPugSeie1DO1KfADqkr2CJDH+OPObD+E9UCNmB74uA4CmaLPQOI7L7Lbj4PG5TyTSHzk3rGW
 70/cLiXv42uRQsi+LiyaqC/O7nb2s++IdgG0aEdzxFzNUGWIS6JGpxme7qHDxz+7u1Yv2gNO6E7
 KudN2DHBZW15HCdLDOg==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a1941ad cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bwPFFtA8PLYw4UJBDK4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110221-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,localhost:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C260C5FEA1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables the Iris video codec on purwa, allowing purwa to
use hardware‑accelerated video encoding and decoding.

The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
except that it requires one additional clock and uses a different OPP
table.

Therefore, purwa can reuse the Iris node from hamoa, but the clocks
and OPP table need to be redefined.

All patches have been tested with v4l2-compliance and v4l2-ctl on
purwa. And it does not affect existing targets.

Dependencies:
https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/

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
Changes in v8:
- Rebase onto the media-committers venus-iris-next branch.
- Link to v7: https://lore.kernel.org/r/20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com

Changes in v7:
- Rebase onto the media-committers next+fixes branch.
- Correct the firmware name.
- Link to v6: https://lore.kernel.org/r/20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com

Changes in v6:
- Correct the firmware being used.(Dikshita)
- Add comments to platform data.(Dikshita)
- Link to v5: https://lore.kernel.org/r/20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com

Changes in v5:
- Modify the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com

Changes in v4:
- Correct the dt-binding description.(Krzysztof)
- Fix incorrect required-opps.(Dmitry)
- Reuse the vpu3 power off hardware api.
- Link to v3: https://lore.kernel.org/r/20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com

Changes in v3:
- Correct the dt-binding description.(Krzysztof)
- Fix warnings reported in the patch.(Krzysztof)
- Add separate power on/off hooks for Purwa.(Dmitry)
- Link to v2: https://lore.kernel.org/r/20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com

Changes in v2:
- Improve the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Dmitry)
- Add the required members to the platform data for Purwa.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
      media: iris: Add hardware power on/off ops for X1P42100
      media: iris: Add platform data for X1P42100
      arm64: dts: qcom: purwa: Override Iris clocks and operating points
      arm64: dts: qcom: purwa-iot-som: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++-
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  4 ++
 arch/arm64/boot/dts/qcom/purwa.dtsi                | 50 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 42 ++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 +++-
 8 files changed, 153 insertions(+), 2 deletions(-)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260209-enable_iris_on_purwa-a000527a098d
prerequisite-change-id: 20260331-purwa-videocc-camcc-d9700d0f797d:v4
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: 66096b909debe4d942eee972948d5a138a5be427
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


