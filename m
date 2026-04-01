Return-Path: <linux-arm-msm+bounces-101383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NKVChBnzWnddAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 20:42:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2F537F5DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 20:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19FEA303F079
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 18:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDAC472767;
	Wed,  1 Apr 2026 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9frPfRN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVjGYsB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7023E022D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 18:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068531; cv=none; b=nnRPAM5/57BUVa3Ov0Oe6Tdwb5Hc0KoXEH09mEBL7QDpw9ptDbB61QMiODuoXbfFXsC868VZG1XrRC30J/q0ZbjHSHlS+2/FEdMVmEAaKf5T4UQsEwZLYIDex8potwSEgWFHG6c2Py4dzKNhP2OWrpH1YEipjrCIBFxm959Cozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068531; c=relaxed/simple;
	bh=FkLaBjvdHKTXYPcPkiXMXOwDaGBYIuXOIzw5mY0DxC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cZQbY13griANyHfq6brDF61LJDVsLxbuXuLBT4hv8g0P0RjE0JBv6Ounbpvqt68ecOfHSt/1mHWA9OtXGN+EA3SNJmTrot12sYjSibeJSHSE4H80NBEafmTsS9DJaYH7xdN2zY16P6evragEXJYOzdEsPLNNT9zgZPvaxL/rs3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9frPfRN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVjGYsB4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631DPgJK1893885
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 18:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wzYzyqXfnan1ryogw3nSbv
	yTOhxtwYpGaEURBuTEI5c=; b=Z9frPfRNs+uC6tbfISbrro71iBJh8/Xztz5q+y
	RaOr/ghc5UZU7dXJKjP++jVCJwup+82gRJkBc8lIuvu4YrrcKlbH44hONjFumP7D
	3bsiCAxh5S6MeNr6Pj2qHtc+SNKDI2hybbsrlHHNgt2w6Kl8rftrBuiZMakSUzyY
	RcbjOIycSVwGzYHK5VUtePLgrBbYgzGc4LxWk5P/86OQqzPp5BlAd12XVR+KAqb0
	SOaDSo/FH/sFS/G+Tpf6lEGpRY8p3PRPRt+G/eilhJexm7xT5woDIbEirlErgSqe
	Pn9YOJTwVsEE0bywHyshbAt6BNe8hPa5cGJRlFfMPLOh3wAA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483s8fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 18:35:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso8447a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775068527; x=1775673327; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzYzyqXfnan1ryogw3nSbvyTOhxtwYpGaEURBuTEI5c=;
        b=BVjGYsB4FjNYhfW9wAVUolPHEN2Axz1DDZmeh2DYXIo47mAHZrzsb6KauA8pK2BiQw
         GJSqFHKeHTIHAulNHpkf0NfiXoSgC9Nkw/WPXcHP00ueSJu6oR6a0zI5X0wDt36lyDtD
         T/3HSY29SiqzwgvjaRCatL/oAR1CHTlLlEiW4LFN1XNk162BxAHOrRKoZ/GiqL3upItv
         S6rXQwXnq0jlN5+QMkD/kvMARg5SalaAcxCuZtPn+9iH9MHvmPWS8s+6VI2XtrlgqKiT
         JRJ/KgD2q09zZ3nFtrzdr3UYLF44ATbH3kTovQLNAH73KJrHhlQZlOZERSyQyHqZZ4QH
         SiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775068527; x=1775673327;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzYzyqXfnan1ryogw3nSbvyTOhxtwYpGaEURBuTEI5c=;
        b=Vuox/5OlKSlavNPeHA3e1Jf6yhxAqO+8aLTjG810VCkXMa6ac1ia810rRVlnDZJ/dk
         0qHpObxdGjHJm8EqFixHTs97aNLKJ8TubRPkKZlLlomlPnA8ff+WfWqGftM7CYNLOEp4
         tJg1WwBh6im+7UPxIODFhg2O+n/p2bikGflLvv6bs3SSK5mExtGNubawHv2j/ZR58Yc3
         8tDEgD9zbNttObazp+KJx1oW8aGMjOWgoYoaZ/0e4Ic4Ps92MdfMqAkjgwdEul/in3jz
         z9WJCdQCPUmrndwQe/pieVFgRLdV3G3RPtP466kG7WzEMCAYuyL6JB6DjLbE4MTQIk/j
         fKyg==
X-Gm-Message-State: AOJu0Yx62fIQGXL+yiSn9/ah0laetOcIRMbrtqSzrNVBDFS3tSgNA52F
	ar+H7vC175GbTQivYGRUqcD2vXI3A/pCqN8vA/rBsXg+7CwCBBYWStvlZbHJotFyGcALTm40qCd
	vSzlqtpX6Q28oFEsuipz6dSld0SwjyIg/y2fkY+Qkp1fBpUe1hAazDhYi5tAvTMmAkkComjYtAr
	Fu
X-Gm-Gg: ATEYQzw01QOPs4YzJDPW+zMTwTYE+YBZElpDax9fsdJt+SoXlvwj0jkWOrfyFOYumpn
	aceSEK6aN+dNmTkQPpXJfmKXy6wMXjlcqGnJZrOYOPmH7XFR6hQ2uH+9zw+e41K6ZH0LM3lhKL3
	FveYF+3TCcbvz6oaD1TMwU1mHrUDFQF7NQIJ6u0dvRZ2xe+ea6NzU4V5d45tzMlUlP/BjMi/mcO
	LKH6Aese5uZQRdgmvr1Z6j3he6wgeOD9cytMV1uH2JOj6avtgm+1k3lkv89OrH2CrMYjxsNdHun
	GMJAnJDFVZRy3h3dLsnPnWXq2QqjMTmGhqJcGXerVuLq6uePa1C4qxduiO4vPosdixPVjmPXa1x
	5js3czeEEVuqvx8vdGGelxxwd8OPi2FfzNu2ppL+B9XEMWzqkX/RC0oM=
X-Received: by 2002:a17:903:249:b0:2b0:62dd:3a93 with SMTP id d9443c01a7336-2b269ab2df0mr43369675ad.7.1775068527219;
        Wed, 01 Apr 2026 11:35:27 -0700 (PDT)
X-Received: by 2002:a17:903:249:b0:2b0:62dd:3a93 with SMTP id d9443c01a7336-2b269ab2df0mr43369385ad.7.1775068526727;
        Wed, 01 Apr 2026 11:35:26 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm5717965ad.42.2026.04.01.11.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:35:26 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix ICE reg size on Kodiak and SM8450 dts
Date: Thu, 02 Apr 2026 00:05:08 +0530
Message-Id: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxlzWkC/yXMQQ5AMBSE4avIW2tCGxauItJUO3gWSItIGndXL
 L9J5o8U4BmBmiySx8mB1yWhzDOyk1lGCHbJJAtZF0qVgi2027XHqAe+BJypZWWdUZCUTptHmr9
 g2/0ORz/D7m+F7vsBjm6jCHIAAAA=
X-Change-ID: 20260331-ice_dt_reg_fix-eda625cda3e2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cd6570 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OaAkpTIj2ik3noZpo6AA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE3NCBTYWx0ZWRfX2vfeRZ7w9sNn
 V2andslgmfrchdLXd8Hl1zcJJqxsFTbJ7PcYXvglveh7AbUlv/x9vOL2/BJXobbmnr8HmDZPh29
 yYlwAEd7s9R/GqqdFe1WNL8Yrc+9otQd/gBUD9rW+ybArtSwMk07xgYN19snX0DRGMwe2SZ6LLe
 Lw1YzIO8lyz0TjnFJn4ID0+VbfzkKazqwf+mIKU7VFHNY7wEwmzAvQ5qjCs3c0HQHWMKwXf69Gj
 F7drP6A4cxsaWEMSdSfs972Jkz0ih8WHHRKL2V4idUVW0LXq7StywTeFFbUD65wZ2UA0tOc/3q+
 90oJfsDmLEFAhscZ6aF9PfUl0cWwhO4Q24vYfbuKPXFWF9Sqbvnhk+baPTXWaVff6c06z+OkTL8
 b/sAOmPpEwCyRCec8mtxKZE9gj+F7TvSrN3jdjwH5EIZ+89K/bH3azp7T2TQ9FR+gw7rC+4JiMj
 FqGNFMX9y/fn3/RUYlg==
X-Proofpoint-ORIG-GUID: _xQr03hedB5nK5U8br7nI-1CV6X5CXLq
X-Proofpoint-GUID: _xQr03hedB5nK5U8br7nI-1CV6X5CXLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010174
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101383-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F2F537F5DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update ICE reg size for kodiak and sm8450.

Ice reg size for kodiak/sm8450 is currently written incorrectly and
doesn't match hardware specification. This series attempt to fix it.

Note: I attempted to send patch series to myself but some mishap
happened but patch isn't sent to ML. Sending it again properly.
Sorry for inconvenience.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      arm64: dts: qcom: kodiak: Fix ICE reg size
      arm64: dts: qcom: sm8450: Fix ICE reg size

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: d0c3bcd5b8976159d835a897254048e078f447e6
change-id: 20260331-ice_dt_reg_fix-eda625cda3e2

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


