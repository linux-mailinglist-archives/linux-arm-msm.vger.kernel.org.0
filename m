Return-Path: <linux-arm-msm+bounces-112348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tz8oFnMhKWquRAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:33:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4113667364
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:33:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k9J/MLJ2";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DZKRcxI+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112348-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112348-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42785308FA1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344703AD526;
	Wed, 10 Jun 2026 08:32:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C19386453
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080340; cv=none; b=h+HyGX5jxa8foYH4dPOg3K2J+zTv2POgn5AnH7ViIYseswyQs2aJ59+6iMGeeDazeZ94AsN8RqCMFmx54VvUvAYpagRKL09fBhdBvVg9vapZPrBiOhomrVj7mOl3wZdCozxc9Z5jTuefSDTFFm2t3tlpoIszMw7YWh8gS0GjYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080340; c=relaxed/simple;
	bh=1ETZ+Y6OK4t4qfWHx3ab49qeY0Lk7h63hvOHITkpQ6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h2ZJREeTr5UxwDxYc2w11rwdmf0BzSndDeAqvyllbJ06gzoyVrKt7HQzCU0bz/ln8FXPAPY3fFzKfK3DCCVWtWdq0i0QcXDH5+xs0tTEm9LMkIOMwV3ji5JUh2Kk9EQ/G7Q1rEhSJhhOfueV8c6wohdnvModBuZpnz1/y3CMquo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9J/MLJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZKRcxI+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7jFdJ948250
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SDTwp8m/1LdhvShPb3TDn8
	+XR4LX0zkaHO0N1ZtReR4=; b=k9J/MLJ28s25hZfXL0splr2jVynZdGMaQM9tuL
	2whMp4clLPHUr4rIorwLIXTSZBT/e9hGe3u6I6qZa6Nva/iLfxIvlwkPz6sluYkW
	jj565G9mXYZheWLJuFjLn430ZHXqB4jbOB4KHWXlwNYNR3IdfbvqAmzuVSjYrFVw
	HIJgoUwUm+VhOkNBgYhpaa9fsWfEfxk2FM27OQ8r/mwhOo+ilStXFmDqLi7EA3mH
	6oM9yOYTipS6DowAsYlP5HDDjl8F6lQJKT+8o/nBY4Y962+ulNntSi+qaiaUk2p9
	KjYwASdA7w2CimT6DqmimaO8fqL1jCGqhO8q8e60se1y5JCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnshf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517615db531so174002421cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080337; x=1781685137; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDTwp8m/1LdhvShPb3TDn8+XR4LX0zkaHO0N1ZtReR4=;
        b=DZKRcxI+L9VYXWNF4EO0lyyXcnoAuD82pry55q/SFcDDCnmXB68jfSdNbkRF4xp/dC
         oi4PXzhjqHv6qKpbJV6D9ixmJlxos/KN+2wMeAePIqs8XkKh4+c26bWk2VAs/qNXGTOt
         Dnsn/IQcQ8EZyVoVvYKYaknsI7I+wWTobd08zbFhr3h6BEFFveL/tqwfMvy7m3/NWqs0
         Bw5GrKOyTHYUoi8WCfldzZg8oJV7te9hkJccMG3R/cWFE1/rQqN8O2AjL4MWsRREXxjM
         MrKtWyvst6QQxZTPzpbgCGT3yJAHUUEHMxI+rpTO8OZMFnz0NcXrFcxJenaJFm2Jsret
         wo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080337; x=1781685137;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDTwp8m/1LdhvShPb3TDn8+XR4LX0zkaHO0N1ZtReR4=;
        b=R/nQ5Vc/Nx9mS15f8RdYm2E/0jyfY7/Ju7H3nWRJjU3Q38iXTNeplaLClVSOyvcGoy
         ZMYNz1xtpFKi4FtbERyY7h5BYvquWj3BNmrAGAJ5nw3ttxutMiqnayA321C6/HrO301a
         U2ywVjNEJN1071qjpcnZK/HVQyjceeH7Gccspp92+hbClhNYrgj9NS7xBSPGcfdg6z1q
         ASHNWDsRdRcJ2RChZNH53v1AL4vlqx1z7FjQ8xX3vGZCR2jyLM2FMPsyj/WAu3S/pkPf
         8hkccTmb1faGpTBWaXrtZQcVPCi0DhgXqK+GoLbtQBejyFOhfcaLG3Hjm4H+fp4KWQQI
         aqYA==
X-Forwarded-Encrypted: i=1; AFNElJ9dKCnP68BI1Q4JJTVW5vD6QE9pj3MoyCNqxI0mHZm5pCvbZVkPOtXeRBMXKxr9TT52/50/wgCpsgu1rgKL@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNr9J7HPneqRMPgjwHLzhbK2EO4t3lf+LvUSIRV/aWsZ+7hKD
	lHqMeUYgAgidoJ6oQCnI3KkJluAykF9E1bUC9xK45mEXwQxOsNI7UJmMaiotlFUC0HCcPht9cRM
	BxnVENvw2nSBhAVZZbzcEfOQwRFdErxER51Ve8LHNpCoaX8DSWcNpOXH1glILf1kgtX0K
X-Gm-Gg: Acq92OHMgfebAWckNIin8+B+6PyoCpUxVez9Sa/1tXnMi8EyStRrdAPZIWEDVvoPEPU
	A9h9AgLKxWg36GaalBOpJa2pHxYi1K5P2x07B5wX8dwh/x7v5TvITL5dHeE7z8r0fcrNg4L7Kjk
	BeszHARm3AWprMGfWnYK7HjeJ/jIX1wj4zfxX8ZSVLHMm/9qqVnwko5zFYOcMzVQUv+6boqliLU
	zrYpo9Ba8faUlecpuO3K23ZVKwjimgFBUTDkmf2vKMNIDtizOng9xMXNjGMRdzBRvPvYyLAsTnG
	2TvBT2ip+qjiMAiWKn1DzMaTv5dAKEAgq4ApnsOhTGWV8ho66bei6cOpJgVUIoLcxGBB6mYAILf
	4QxHUkNmc7hQ7z8Pwfxz5DJ7ipD8Q7HoD9HGTQZf8hTOCnCkKFwlD832ZfVCeQQXf+HAjZjqjUb
	0VKjptVw6J9W2usr+F3I4IWOJEmyOKuna2J7VkTkWl6AvVC+LvE4lu5cPR11YYJy49rDnrEaJ0P
	SiQvKE46nZD
X-Received: by 2002:a05:622a:2cd:b0:517:6b57:8164 with SMTP id d75a77b69052e-51795cda6f0mr359454971cf.55.1781080337102;
        Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2cd:b0:517:6b57:8164 with SMTP id d75a77b69052e-51795cda6f0mr359454761cf.55.1781080336736;
        Wed, 10 Jun 2026 01:32:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] Add INA232 power monitor support for Arduino VENTUNO Q
Date: Wed, 10 Jun 2026 10:32:12 +0200
Message-Id: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAwhKWoC/x3MQQqAIBBA0avIrBNmDKS6SrQQnWoWaShEJN09a
 fkW/1conIULTKpC5kuKpNhAnQK/u7ixltAMBo1FS6iPFB+nJTrTGx2YBmRrx+AJWnJmXuX+d/P
 yvh/xJWDDXgAAAA==
X-Change-ID: 20260610-monza-ina232-de180e669dc1
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: fihCQThncyVEKkJY8zbgaOQiPALhE1yS
X-Proofpoint-ORIG-GUID: fihCQThncyVEKkJY8zbgaOQiPALhE1yS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX6AerXsFmwP3d
 /Y30dkfmix3ZaHd+7DRxHmLBvGm2Ko64OrwGcvOgl8B2r+mZzk3a9DEngpmUf2ptKd9FFNepg76
 Q+yaW1YWeXw7oi1QShtC5ivf9LSzYbgVDGccC7nKsVs7CNHEVG77XsC0S8b30ZbupfXO6lAi1ar
 B/Uduc6zAUKXUEnwGrReKWhByznVsYVX/PZtHRmcwiGkWqE1wgS7EQyKGyHkyPxkfGJgWEO1Xn+
 6vLTEVW8AefZM/4Dw77yL56MvemeOOAqtfU/OjBbwsfPdWV88BLxfb0DLJ455rpZ4erZie4HEc2
 yHlj2mpd4ECgpyNf34C/wLFpSF6pQnaHjPq8TVlI1rgyXTA8xxOs7HtLrMXE1R+RVNHgyic4dJY
 ShwXDDxPPKL0hKA2YvW8omwilvq6B813YD6VabbOnE3sHj3nX2N06RpWsFfhFflLz7MniujP6t6
 lm00JTmzD2yfFCCaIZQ==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a292111 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MAzMz8joEOkdVeTcSskA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112348-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4113667364

Add support for the TI INA232 current/power monitor to the ina2xx
hwmon driver, and enable it on the Arduino Monza board.

The INA232 is a bidirectional current/power monitor that shares the
same I2C register layout as the INA226, but has different electrical
characteristics.

On the Arduino Monza/Ventuno-Q board, the INA232 is connected on
I2C12 at address 0x40 with a 2 mΩ shunt resistor, and is used to
monitor the board supply current.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (1):
      arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

Martino Facchin (2):
      dt-bindings: hwmon: ina2xx: add ina232 compatible
      hwmon: ina2xx: support ina232

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml |  1 +
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts      |  6 ++++++
 drivers/hwmon/ina2xx.c                                 | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260610-monza-ina232-de180e669dc1

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


