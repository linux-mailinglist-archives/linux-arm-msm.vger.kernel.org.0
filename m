Return-Path: <linux-arm-msm+bounces-111192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KObPNq5uIWpVGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:25:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9679D63FD42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:25:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GkSlNpTv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jO3h6HsG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111192-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111192-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB54730BE304
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6CA40F8C5;
	Thu,  4 Jun 2026 12:20:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB535AC13
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575659; cv=none; b=lzD3JcmZLi4Uzgk/FQTVvC2MdIG9kTX+isfiTFc0nQ90pJfJvdH7PgtTwHH5MrPEnef5/qsXbG9+OL9QVNG4rX3KwFLJinfVBmJRpROec0voNU8TAE3tcPBLcfEEU+3HF2Ky8+KhwU6/hX9Uy5kdHub/SjhbPMOQi0lnUgO9G+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575659; c=relaxed/simple;
	bh=p5xkoa1gmzX1cE3P0oVCRxj95EpSdryxboA/A3wsVfo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uzp5R0uqyI79llfSvh/WTbLCpK/TKCD49XvqfE9EMlo1oHMCepZnlMWOyJIlwGDjn/ifi6ghr5GkW4PtCrwawzG1IF2nyw7627VAskn4T4CvjyZydcFAqwr/52qA89XrMDHfRjGLIkg9enGQbzIMGpV31UjM2dOV+PF7jhmTzmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkSlNpTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jO3h6HsG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6549v1TO3233931
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=shQsQJ31RNDx6YS8P72R3K54LrumYBDuPna
	sYDlIeVs=; b=GkSlNpTv+1E4moRuv1BAC3kOWj9w1MEWZ/fO3nBL9VAO5wSCqkH
	7YVqndGukM2rGajUq2S1pyvmeK4kNDdHt54v0TxoPKeZHsjycCRnPCMQ5JcJ/Wex
	Q9uKprDdd2ecL8fPs1JmKhq4tGCAixM9ies6bUvuVGvnF9Rv7+7fSG/b7P+iFVWW
	/epj3CKhdKrxNLiY9WRLroZqDZNMoufrJ9PsIB4vI90Zb81yJ2SuI/iIW96D0m3B
	3nwJvSXnWpQ3ncnvbjEs+Y2K0zhsXdL4RW2CgoFqhZEoxn7TDx9H5OLIiizXVwdO
	FMfbbw4llryJnvkU+Ol9XIYjgWG3VJ4tvhA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s3n8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:20:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c850ff84ddfso869317a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780575656; x=1781180456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shQsQJ31RNDx6YS8P72R3K54LrumYBDuPnasYDlIeVs=;
        b=jO3h6HsG5t8uhRySCRfkhAtWY7UkMisd+sThzIsT/y8VKbKAUETkKllpAmg55DeLAe
         nOf6YqD68WK5qVNF0OVylkHKWmnjUvsJ6DGEDviVAfb5/nu3ra4okd2Y5NhKUempuRI3
         mT/DKf/ZVz9AZwm3Z9P6EMy98y5L9FdaDK/FN9JJwsGIUWnaPKvsSsmTs4c/99zuUmeP
         heirnbgVJGW6mrl1LZTuo7uhczSRMs7k8WI+p/1HviMSJauECRmzUywauin0n9mKDiZY
         JYut7MyeuCW5n07gkU83SroL49GamZnsLixCezjPDhIcEhtMV4bbhBUCv2EUQDEKg6Qu
         OH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575656; x=1781180456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shQsQJ31RNDx6YS8P72R3K54LrumYBDuPnasYDlIeVs=;
        b=PE6hc1PwgHQeWF+6qDyI14H6OiDBNonTCHXXr0ZrsFZapoQxpclNisfm9CknFIwkcQ
         R4mpWR2W70sklmPn6g1pNf9L8UcgmhfDPVpsj94Y0yIzgKgX8FAUn6VBRzZR3CNUD1aB
         ug/d+MinabbG75jLWSCoNfvKULezVkbfR5AnlYhMD49duMNT/ZducR/NWj6Uk+34av7c
         6T99PZdre2bLaoeZ1HEQXkIOjx+B+ne6pTFndvRKztntyeX7yN1jkG11KU6OjbBGd85U
         OHK9CRXyCHbsn6mcQ5BHqvKBalWgdbrx0AQRqOOt0F3fw174KXS4pccRMABcFQ7SrRne
         g8Mw==
X-Gm-Message-State: AOJu0YykCzoHfClJJm/Ikd2hBlP6bkULU6kDMK+AvRM7QdMdFdpt7A+t
	m53xxzfO0oOa2QLU9WZ+xlG2kdlBjMI0FGimMnbG4sXiaY2mieFxnehxBlD1XJKje+qvGL6Aq1y
	iVKExyMiMj4YQUfg7TUQJNKyuNwBPNBiw0NdyOgyg+7PA6RuWOgH8OqmOGo5FMlV5ItjB
X-Gm-Gg: Acq92OH/AMt8PttWgqmUjQlMeGbs9FMZb9GGNAaEt/jS3dW2jLdGQAYyLDC5v+advPI
	13YuEuBd7QxrUV5Yr4Ook0Gu6KyTrNs+oADAVCAFAFeZC4aGcQPyiTSQWysFntdQxUyhMSGf8WA
	YfpiBnad0Je1AQTJhk7cxRQ3MbiSDBTQ+r+VWi75Pb9faRxld/9Iu7eMz92BLl3B/Iwjsef4Aht
	9bFbQzXd58U7j0F57lReddvK+ho2G7Yk/EWxVu9RQpNVC3pI6pxSbPwA4ZnGVTA9CMNFgpoJMdy
	djTyB48hKSPyfY++5rh7dloRAcTNnjoFLKytVYntx4T9bLCgLJSnmxhnR1gJ95AHJZlZtlmM1zA
	bz5MSazUFi2e/wkQgProKKdW7UHPdv9Knn9R1r5tyl9n4n2Kr4q0og2lkZw1N/s2Yyog=
X-Received: by 2002:a05:6a20:d612:b0:3b2:924f:70af with SMTP id adf61e73a8af0-3b49798a73fmr9004094637.45.1780575656072;
        Thu, 04 Jun 2026 05:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:d612:b0:3b2:924f:70af with SMTP id adf61e73a8af0-3b49798a73fmr9004067637.45.1780575655609;
        Thu, 04 Jun 2026 05:20:55 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df045c2csm4796903a12.12.2026.06.04.05.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:20:55 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V1 0/2] arm64: dts: qcom: Shikra SD Card support
Date: Thu,  4 Jun 2026 17:50:43 +0530
Message-Id: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IOOY8Wi5KLkAz_skYZzkltytp0GSVCCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExOSBTYWx0ZWRfX3ePj2/0eYGLI
 QKMJfFBC2yXTs5IymK8b1gLnOJUznc2a/wmgtBCWvdBdtebeg8zCkI1SOoAb8n5BJadpONhaPb7
 yo8N9zA1VsBXKVv7lUD0C5btZj4o71XZDl2be+f9rGvTRlkkGR5H3jANXD66Pbm3N+L/FfRYvec
 g/SIqYrxAvRNw/w95F5SLlgyf/koHRWMlCVpZh+dZBzvAF3ub20VK8xrlSOsvQUbzjjk91GrX5o
 bDfELob3UNhSTav0AUqS2HS7N+1m2TLnT/EovsCkZ6e3ro2skKzuYhQS0Xi7bLA8rIoL+oqZZyI
 JOfE+0Nuu+SyLnuvAWRTcpAgZDGG6y7Dq3qEDT+04lBFQWmNCdkZ3/+l+qBOS6zS+jAAaPnBzKO
 6TnPJSyseigmPs9/D/qaBSwLXMhDrAwm75u5aapn/hEEqldBQegZYrqZLdbxAVW7nDbcbHtvGIn
 IeFnwm+X9i8278Z+HCQ==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a216da9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ms6Ar7DOZ4z9uL9UNCMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: IOOY8Wi5KLkAz_skYZzkltytp0GSVCCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-111192-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9679D63FD42

This series adds SD card support for the Shikra platform.

The first patch adds the SDHC2 controller node and the necessary pinctrl
configurations to the base Shikra SoC dtsi. The second patch enables 
this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
the regulator supplies and the card detection GPIO.

Testing:
- Validated on Shikra EVK variants.

This series depends on:
- https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
- https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
- https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/
- https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
- https://lore.kernel.org/all/20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com/
- https://lore.kernel.org/all/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com/

Monish Chunara (2):
  arm64: dts: qcom: Add SD Card support for Shikra SoC
  arm64: dts: qcom: Enable SD card for Shikra EVK

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 93 +++++++++++++++++++++
 4 files changed, 147 insertions(+)

-- 
2.34.1


