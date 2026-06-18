Return-Path: <linux-arm-msm+bounces-113764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AbfuLFbfM2oyHgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:06:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F16469FEB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:06:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZGGP8bHX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VzMA4Jj1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113764-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113764-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95DDD307E023
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08CE3F412B;
	Thu, 18 Jun 2026 12:04:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F31386429
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784244; cv=none; b=uRyekxcChncF7SyaxAdVCtriVv+tWAE/Hax1PDWbYMHtThqjroBuHfRQZyUn27L11bRuLJBqKrWrXba6Ck5znZQfJXDHhRGfe+1e2YPxnyhLbtqEAJQBEFkNrVTUe0nBFbkpYeFr/0mcJeZWGbCbOGnah2ngPKfASrVIuGb+rCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784244; c=relaxed/simple;
	bh=lM/+HQ10tvf1R701ouGCzmNMFYljSAHwzFnpHVHglxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dYbkOV47Neetyon0uJR/qv1RJgkJAqyRccxVEgT+4oAbjLm1gnS//RoDKikhlFgeF9vU4ds+rE4CVObmXrrW7+9d5Q7OosVwIJ5/kCuRR+KnYTzGGbrpw0GipFwVUeSoE/n6aw5v19tF1VhohpY6Y5G0Fs3ki+u95r48J5NhRO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGGP8bHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzMA4Jj1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArfSC3763671
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Tlo0yxFkGw3BQgSZUCX0Ll
	F+Uw1OrcPE+1KsAp0V8TY=; b=ZGGP8bHXCi6l4zAGGBUOm84pbQCxDL94VZF8Cw
	l8yzd/aSFlBacN10DxwHVpt9P3K71UCupA3UNY+eJ7m5WCO97bj5ClW0zQZ26Jl0
	oMMGHf4gNznwefm9+ipG2d7SMFRtD0Lg1bWPWI7wmsAPIg3LfFdoyoXLrOCDZY42
	aYAbhrZPMx9VWRlmv/3kl7GeHOYbcSkEEzV7P9YGRLgbY3vjap1ZhFurvabHU8P+
	uwOBoqs1tutQWEYs++uybygWSR3LXeKlXzjzH/7ntbG/MyhoU95QqF0vxG0cTn3G
	M/bzWLTigrjT92tC5rj3FaaTtAxMTCRRsM0W49TNmMJZ/c9g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk38d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bccca5620so985476eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781784242; x=1782389042; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tlo0yxFkGw3BQgSZUCX0LlF+Uw1OrcPE+1KsAp0V8TY=;
        b=VzMA4Jj1wp53yQiFoVK+1jaC+fgippfThZCi8y3L9ZeG1VxW12JRifRdjqf9wHTOf1
         qUuT6slXqwBkjaDwhwyud8JYl66UzSQSolpBxrm1tLHhYJrYWWgx8NQiOxLrENpkeyDe
         iPXdMydWyeowuCnlnTuJ+Q/HQ3zjd6i45mHUVsMxrlGQX7W/Trlb3meVTEFvJlBHvgW0
         c13KyRsy5681cpTNwbuv33g7rwB7jRYE18F3GLGN3PPn2z2U+M0qxO54fF5q3QKWq/lh
         MknhL45s46PEikS5NcNvjQ2tfEHHhi7u+RWkpZEAgsswacdUtVwl2DqriR80W95+T+qZ
         vFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784242; x=1782389042;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tlo0yxFkGw3BQgSZUCX0LlF+Uw1OrcPE+1KsAp0V8TY=;
        b=Etl5luHQA/Ih9kNYxyZ32nN1ZVP7JQlSF+UE1uUEM047bPDJ+2x8csGu+cQnAt5KNZ
         2GqB+YCJpmQO6TDA0AznbpcVZt4bY95cZkyy/UI5RFB48/2q6idSVbNyYC4U4ZQZpT3i
         SsErvcvq7kFokMa5cV9u8fnS7kLQq5gBoNq21mWIF5+VtvEhyFaz1/RTWtpY8GsE96xU
         OhgXTr6+At4FLi6or1wYJKc74eksV4MbQkQDH9aGMHAJUBANhLRZ+VPPKDoZt2yHr2Eu
         Ne6mj94Oq4wcjNmy0jVmGzJ0Ns8AmolL96kJRx6q1GsDtFEEZPcZ+Dis4Q8djVCNQ1Qj
         ObdA==
X-Gm-Message-State: AOJu0YwMFOx8U1LbkCbYepGvRr4OxB5ytIo8VIiTunAo/mpR6jCi8BuR
	0VA8McBwMi7sLHv0UAJtGDYP9y4W+2mTUt58irqBXjMcd3dqoTLdCQvJUUmH31phFfPtsSUE2EY
	FM8oGQ5Vwn4HWPGPkLt/2h+Y5Q9W+meTb22oxK57cOw4gZCNrSKM1nhFkPc7Clz3LSuFp
X-Gm-Gg: AfdE7cmkTfDYfgWBVDxT/4jTtOpW3umhgeP6dVSCHLxNL84su3phAdrCdxsFayrTrw7
	Swc914cxheng7DsWZluF2FMZold2oLIbFlFij00AmOORUt9ZU56B5Ag/cBYJugytNPWvzmfn5On
	SZ2JfYavorrWRkQx4rE9GY9I13yApQejMAUBPSYgPdUuPowy6yyuZpU6xpoPAMeF89RSEerTLIM
	r1et/QzZhGlE3hFRFIbGWHnVhj4SWTobcuKacC5VQwpdO3oSJW7RUEegu28lRjNRt6P8fmnLVX5
	wSkg/viI/Bt3zoPqriPWAQUhT6t+q+iPlXUlzZi9pHePDGSNjSde4ikoat6Jg53ftOgIMqrA4Lv
	V4sqlIE5YvQhdGbTwBm94O2YrgILqbbjYu5ul92R0kqLtgmWPU2+tNWQdxymKv6Hkrg==
X-Received: by 2002:a05:7301:7c0e:b0:304:d32e:65e7 with SMTP id 5a478bee46e88-30bc915f658mr4891000eec.0.1781784241548;
        Thu, 18 Jun 2026 05:04:01 -0700 (PDT)
X-Received: by 2002:a05:7301:7c0e:b0:304:d32e:65e7 with SMTP id 5a478bee46e88-30bc915f658mr4890952eec.0.1781784240967;
        Thu, 18 Jun 2026 05:04:00 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30be0c45a16sm4177713eec.14.2026.06.18.05.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:03:59 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add CCI and CAMSS support for SM8750
Date: Thu, 18 Jun 2026 05:03:49 -0700
Message-Id: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXeM2oC/12OQQ6DIBBFr2JmXQxoi+iq92hcoIyVtIqCGhvj3
 YvYVTeT/J+892cDh1ajgyLawOKinTa9D8klgrqV/ROJVj5DQhNOb0yQQb7kW5JadmglqRqaYqo
 apioBnhksNnoNvkd5Zovj7LXTWUIlHZLadJ2eiqjHdSJBzVkGB9BqNxn7Cf8sLBC/6fxvemGEk
 oorkWeCX3PG78a5eJzl+7DH/kC57/sXIU7s8+IAAAA=
X-Change-ID: 20260518-pakala-camera-bf03e3df1db8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: SvFOwgwaYjCW0OTFlwjym3Sol7lPpjE1
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33deb2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFdHJre5LK366wQswZQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: SvFOwgwaYjCW0OTFlwjym3Sol7lPpjE1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX8kkGbB5lOZzz
 n9LiCmIOmhKH9DNMk4vFwPhsre1TBOrNBHiqGk25qtrwTGhalavYum1FSzNWgz3WuWKflr0MFCQ
 faXdTgD75QfEI/nRxn8oVke2HXV5J8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX9n5G2tYm3VJj
 z3mMJ8bCJhe9Hq0mgCADGvQOz/S0TqkONJEgT7gh2xBu7/7s+oqHYx8i1v6pwzffWejMLxkGIkz
 IKMYTb/r6YzqOKgEONnlmQHfYCpUAVAOXDe4Ua3Szx4P+UwOOsBTUvfA7wWLuj393+qswGvK2Qm
 icPAC6KfX79Xo1DhYpTxqJp4ITcJ13ZU5VR/ZTbl+FTjN5mBsVGgdkcD1ubvbOJVHzbmtnQ+8Vu
 e3MHWGiQZQ6RkkhGABWt5fzw2ooxbFO1kRLEHuj1YExesJjsdBuYO2Ajau38DC1qf5dRnNXQLSQ
 mySaEBk7LbPZIQPSENlpklEA1NBBbDheYZm5uLFeXGdvV+jqK2972bICdU/dNJkUp4l/UKfE8hJ
 QsZm9v/kzrcld59BBhVxjMe9lu02TpezA5FerKf/BvdlIwHkkgApuXUgZRitvvl8jpGdNtlHn0d
 V9F/QNfZ80WGRd5jXEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113764-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jeyaprakash.soundrapandian@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:hangxiang.ma@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F16469FEB3

This series adds CCI and CAMSS support for Qualcomm SM8750 SoC.

This series has been tested using the following commands with a downstream
driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/all/20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v2:
- Fix typo for mclk2 and mclk4 tlmm function
- Link to v1: https://lore.kernel.org/r/20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com

---
Hangxiang Ma (3):
      arm64: dts: qcom: sm8750: Add camss node
      arm64: dts: qcom: sm8750: Add CCI definitions
      arm64: dts: qcom: sm8750: Add camera MCLK pinctrl

 arch/arm64/boot/dts/qcom/sm8750.dtsi | 541 +++++++++++++++++++++++++++++++++++
 1 file changed, 541 insertions(+)
---
base-commit: fb80987f81756cb697a01362654a8e55fb505600
change-id: 20260518-pakala-camera-bf03e3df1db8

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


