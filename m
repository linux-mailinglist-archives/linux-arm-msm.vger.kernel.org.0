Return-Path: <linux-arm-msm+bounces-113938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ofQZGOPZOGo/jAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:44:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D66ACFEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:44:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D2bNQ0ff;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YyUdm7WF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113938-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113938-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 569223031CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BDC35E94E;
	Mon, 22 Jun 2026 06:42:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9A035F164
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110529; cv=none; b=ai0CejViVhyWyH9eV9wV8CW62aSUdp2g+E4kVVKcV/BpfSEVq6D0aE5neCsivu4QaNfzknL/m2uuhIujX7QAbOvMcmtFzGlyNFcm0VLzXcTyUNVZTQD3ZRJSKCvVsD9lH4Ul2Fkl0OAU6+JFadK0sm8hl4J0hdFF0gl9hkAfzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110529; c=relaxed/simple;
	bh=NiMErQwfgmQozkXEiQP6zrM8CRGbezCw8bBHkO4XflQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fALh1nfPdWf2+VzfThINDDIOVlyWmGqmWeT5JXvGGtAZI0nS+i/G0K6IHTArETYWIvKswdDEbV6ElyKiWX1cl8ebVnmMXulrd4iSjHz9ow070n/bc7YfJ6iNIAUoqU9h4fZxdHkwr2gNUTntrRsltg3esvO/KsriCZ05FztHLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2bNQ0ff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YyUdm7WF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BPwU255465
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51Z2lrH+aOB8x1t/xwBkcbadFe2AGDTxRJycg5CNscw=; b=D2bNQ0ffOfzBOQON
	GtxJyUbvxCfPRdzQgDp7o8+Z2VTO3LnX58hvjz0F++unODwDSlRbWIqjLdKJTQK6
	WHM/eC7vbLn0XCdrSqETup2MepiTFqBHpatkiyVYGqUaM3P7u0HCGwtqcOgO/qsK
	WckDXeQwpisf0FOSGoiaVDGJWbakhoTX97odUYXnmdeM+nnLIyr+eEm8Fy6SkMPu
	j36suDnvqWxizwWmazEEov0a4ug9UyDRc0mksnS5zGagf4fN9xIdtZoJJMUwLyp6
	PwWmAnna+TKbvnEqZ71gNFhs7sxhP9iPuuv7BWFxxmhFfoWYvx+HU1hqJWhrJM3i
	j0Q5lQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5n7nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137eced000dso239766c88.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110526; x=1782715326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51Z2lrH+aOB8x1t/xwBkcbadFe2AGDTxRJycg5CNscw=;
        b=YyUdm7WFRzVdc7i2u1EAKnKemBMgF91yWyyZ/qyLptuWlk9IHTWJfXa21n1p6f0KCY
         0mbJ/sXuNcUojturbwXTHlYdzzNB07gPozMpT57VW0wmYh6W5YeFTlcPOASnUJ5ecjgJ
         xO7+T49j9JO1Riam238ihdpf3BVcOXBWZbopOEj9crRKGPxEqLggSy1eHTiyGvLnY7QC
         FDJgWdjI4B2tZgOENifUiny2WcgM92w0jHztxxgP61FKNp8ANAWQ7+s5hwUIU2nMPmJh
         LRrA00eNlVNmaeyBP2j2fSCv/T7J9RNZaVTMsgkWTp9usfS6vWzjm56eZDF75ooTtfFl
         WUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110526; x=1782715326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51Z2lrH+aOB8x1t/xwBkcbadFe2AGDTxRJycg5CNscw=;
        b=CG82HrZjXNRrjFHKl46ckwS8TrcVvEBCbN6DqMemtdEzdBTXtP4MvNe1i0BABqSPpS
         891zfbMc9zQQGHGLR375s0T8wntZHAT8buPsh6DL3tQ5KzgGFKXUE3066TZ+LwbLrPgR
         aGPW1276vElo0Xs3zh8NfBEw2DlB0unakV5KTcTwKPwmC2PoNicNQCRwDwmiL8DIej3d
         iW4f4kBF0tG74EX3UvtMemKv+3aH1gtbq08WP5rcaMSwUcGBV6UhMNWFWhRLgbqNnOzO
         8IIQBZylQIZTCqdq+JoMpK2PUBHU0ucY+kI1mJY+cz/x9nG3/m8rfnLT2KOTVT0QnYBL
         h4dg==
X-Gm-Message-State: AOJu0Yw4Td0mxYRfNyH4VXhldknSPVKL7KnZNS/BTN8HAe3dxhOspKkL
	juLSE53V1xyV3dnmS0++vyclsbBN8OXrnoAaWpW27IIq+qYwbQDZoZ/nP71kzocTiu+7bdmfZB1
	uN05seRB5n3WLH3suspErtEg8qHHyL7xkT8xT3u0QsF/an3Aua7BxO9cf3pWKvntDUN5+
X-Gm-Gg: AfdE7cnjdj/CUOiMVDFX0qQ2VHPJXJnauDZkDCCTeLnb8FcaKor78ow18d9LJswlzaI
	FJFUpWVBPJh4/UfTSj4aHwvK1V3/0moQkByT6CHaSbmkzt96cYqB/NtwVCmr6vmGx3wV/RqkXLP
	/GC6oSSLkmDZHbHu41gT4yshod/YiKQpKxDAwNDV7E6YCdEhnRWwUOdpNeznXcfKHOM+F5HhXIF
	zq7Nb9puhxOBEBD4bTSt/JVMzp5JMaKNF4/N93Z/SHdoT+SPcKdfIC5qc01/5Cb9J17FeVjVayX
	qSgcF9W0dJmgROXbYgcFAenqoaqy0V3VXbkF3b3La4La0tz4RY5joUJhUbvmgxXCbDoBMlDicYt
	8eNoWXOw3nVmI6+9kSuiCI1Z98nulP8ayQA1f5b1KGAMY8N6ZRohJ6lI+xIGClA==
X-Received: by 2002:a05:7301:4885:b0:30c:48e4:972e with SMTP id 5a478bee46e88-30c48e4af84mr258595eec.7.1782110526061;
        Sun, 21 Jun 2026 23:42:06 -0700 (PDT)
X-Received: by 2002:a05:7301:4885:b0:30c:48e4:972e with SMTP id 5a478bee46e88-30c48e4af84mr258580eec.7.1782110525489;
        Sun, 21 Jun 2026 23:42:05 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be95ebfsm9357803eec.31.2026.06.21.23.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:42:05 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 12:11:56 +0530
Subject: [PATCH v3 1/2] arm64: dts: qcom: lemans: Add compatible to the
 PCIe Root Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-v3-lemans-split-v3-1-d26bb22594e3@oss.qualcomm.com>
References: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
In-Reply-To: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX7DzHLLm1sZ3w
 VZXIKQG5/xQury037rF/ctgGNcv7bSmGXBkO3bErzT3Jdm+Oqs4lOeGB+TSuqsyRyXsnPtKzJpN
 Zq82poOyVUhWWLDKGpeAbCE5WTRskl3tnhmHwWl+5ctpfXqrO2YSlWWx6fv2cninexicpAmHmwv
 QRJGElv74PCbh3FOLEDa4KioVv+vmNeNrBCuLJkYf8MDwrDfSUw73bKEMguHXqxAaJOmTzwIIXn
 vS/cA9VZszMRVslzULjJc0tnfoQvg4mCjjp0QN24shrL1yD28hK3AIS1PUplVj8P9Kfo1sIW5ol
 Kxe20JKjb0AcoD4y75C+5SOYzZ2cUTYT6oIxQHVEGINrrHvaNUAvAH39gtJEpW7lb11Mnopq/Rm
 FL0kozTJDi2JbFO2fa5rW+Y2UZ/hvnqT+9RC1ym222qhHWYcG3yibBjnag6azhlAdyKzWwZCoUY
 Wtl5pMoabRnnzHfHPzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfXyjMAEYhuMU5o
 uQoiDUtEesC1x14O1IiNSVVYjHUVzsenOtJi5xOz3oHpmsN7aGJYTJdvmd7FhyrCqbd7/nU8qca
 +5gLEjspOhNz04N0sqCskVq0VNLE738=
X-Proofpoint-ORIG-GUID: nBZ-NCovmiFYa_-BBgkAdHqtAqb6N8a5
X-Proofpoint-GUID: nBZ-NCovmiFYa_-BBgkAdHqtAqb6N8a5
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a38d93f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=di_LMzEMqSThqvFnUwkA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113938-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:wei.deng@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B32D66ACFEA

Add 'compatible = "pciclass,0604"' to the pcieport0 node in lemans.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..9afd6e8ebcdb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2779,6 +2779,7 @@ pcie0: pcie@1c00000 {
 			status = "disabled";
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1


