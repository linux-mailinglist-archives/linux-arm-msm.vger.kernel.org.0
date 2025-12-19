Return-Path: <linux-arm-msm+bounces-85808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3ECCF413
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E515C30194E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BBA3002D7;
	Fri, 19 Dec 2025 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1OZ5uA0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQ0cLq1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D302FFF83
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138451; cv=none; b=fS1JrUlgusYuWNrZ6rUezE7okBf+rOTLbZLqaylR/nlvM5FwpOVTfPAzTCKuGWaEwKvwF9MO3ylwIg8730DhvYzNJcOe2leEA3pCQqysatzrfa0OPsbrOCwHcRIJVWyj/ohD+t43pC2p5AdfQrogJKVcqHAuW/VN4QmKVzuWzeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138451; c=relaxed/simple;
	bh=Jluheh2jHquG51NTxi5u7y58uVIJrXt+KUDjFXNRtYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KO2XSaj3tcITGaFZUN66rZy9j+EIdtJJXAU9IOXpUD8UxUntuazpzWy2EJiWOh+1d3FVmelPfsbtMXp2X2A98GOrKoL7tGZrD16cV9TCyA4CfKVvMSwbOd5aHkiUjZdU58zVJ3njpPvUxhgck7cLyAYkFTwPSzT9plDeJmNehWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1OZ5uA0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQ0cLq1P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cONO4145756
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZDT5LOQJiRveKj0afNkIJoST5Y8WOlaS6II7EWUiLc=; b=E1OZ5uA0oycFnn95
	YKQmspMeYchnuizmt80l0v+/K5kAeWDgm54yuB+Jb1h8pGLMrTykqYTAuShC2PEr
	u3Rhohp7HdgSxPBfxnQICUmF/38SRWwPZPWE1IlhrBl0uslwQvkAsZK6ARNRj7B7
	8dVTt2ggEPcBob7WrzsQmhQg0VVtBpnp/yVPUy5ZlPqnf2BPRxSgAdQSG5+ZB/lD
	tTHHwC0WI6hq3crz49+keBnSzb00KdXRANrNEOq8nn6eUehnWomuYoj+pPHaEF1p
	bCpUXv6dwC3CtznFVudILpRsReGrC1KiVmiZUEL+mJAUenVRM1AbMvVSExn9dhb1
	xH8LeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dt81a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b8738fb141so621466285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138448; x=1766743248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZDT5LOQJiRveKj0afNkIJoST5Y8WOlaS6II7EWUiLc=;
        b=RQ0cLq1PtpKHgTC9TWbrjilgbZOukzUX6KwYgGlMVotjGB5l6KIiEOaTfRWIgBw2tX
         tkLG9xUf6GXk5U8Bw3E/ceDrR8GaXWOjNX0a7sn9Yb5GpPATyRLWrVFhXy0b+p3Xyh1Z
         RR3WasV9teDkjIyYk4/OL6dsc9zZUdxemkYw3XzhrhPPB1HkNcqDodiricRSscThLCb7
         HBov0wM8sDMsJzZAx4n91WWG0rCTXDr5l6ItOoRud/8+3dnZfdc/gopnW++1Yw6XouOE
         biowrwUsk+sxYhFLBjqqQEqlw7LQ3GzSeBuDLMTcvEX1fcbjAig52CSjzy4Gq49JqdYN
         /oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138448; x=1766743248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZDT5LOQJiRveKj0afNkIJoST5Y8WOlaS6II7EWUiLc=;
        b=W3N3P8QAXUs5E0uw9qrWlJ62Fwajyqp7Ik74zjy/LJy9KE1vTDWy+1k9iJ01HIXFvM
         AU5nAQyojCJ6ysi7CTMGuUe6GQwWq8ofs08Kycy1a99we6N4eVdFC7FBHb8FKlUfa6Qb
         hhihmCZQ4wWR8ahXb8UmFJrxDRJWWriEaZ93TedRGBnCrEt3js6lshXdvw5WGyuQ2dnu
         R7PbbDEot6we18D+7cDfHJgnbjMfja6evc5TVsto4J2tl5ET6HvvWv39X2h/Vi2Czkx3
         v5v9MLT2F1STRu9nkh1cM6ZCrvcjDB8lMnMJVghkn+2kCx/c8CSHKkerlxajYz0h8m0Q
         mX+g==
X-Forwarded-Encrypted: i=1; AJvYcCUjLZ/CHccyslrJrEeZdqzK33KwuG1V2n0Oc4sXu/yqtXZ3NQdUdgH9r+YFKCa2eSAVaix7NJWlPNihl3kQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiwebj/pmSpiuUdmigNcp1THc9rKtSgF6M7l2gXaneVDGVZ4Iu
	w6w3N79BLXnNcFvVwfYwpjSGMwvWGrYelftswe3He31cm1bDGYt+E++nHkMQtGpsDNtZgDOskn5
	T/umm8vQx9ivuXnuuNQfxsAy0YCSi4AKwPc3e2hVP3FljG+VEWqeBqb5BNWlKRWZE6hjr
X-Gm-Gg: AY/fxX7voibPWXSPDDzLgihq3QKETU0erLqT2b6f1QrWk+trCCDwOxM3WHO0LWR12iQ
	LDSXCrj1NB9PNxC9FqZhUbPradWZ79dv8JNVLxdnaoBRY0tUsekhJTYs3FeDRmACEFLPPCaQTEC
	Mq++f97iMeHqxqva+MoHIxubW2NeiFbqH0IUmAFEggIp0zUUhQ3iFLsSN431U3H9PURnM6SXdrH
	shxi7KRYPVm0CFHqfgU/dXiwP4/kNBk9aq01qqWCOIMEr48G/cwxHyYkeQwQVi47xAGeQv69ew5
	AhVFrHpem5boUxnAKi3ZLqekhc1+Bsmc7deEylhcRuhkZr5VBcCtRjJLuzHCzT5hLc2rUSLSNBZ
	MKhEaXYFPcPGrilk=
X-Received: by 2002:a05:622a:30d:b0:4ed:9264:30fa with SMTP id d75a77b69052e-4f35f45624dmr86977561cf.31.1766138446541;
        Fri, 19 Dec 2025 02:00:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9UtKykWpaEkxs6kiRs0NfY+njLFW026gAdANjggNhdxoRU2Ew+Askc2CMcbS38/RUZv8LzQ==
X-Received: by 2002:a05:622a:30d:b0:4ed:9264:30fa with SMTP id d75a77b69052e-4f35f45624dmr86976751cf.31.1766138445921;
        Fri, 19 Dec 2025 02:00:45 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm4106563f8f.22.2025.12.19.02.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:00:45 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:00:28 +0200
Subject: [PATCH v2 1/3] dt-bindings: watchdog: Document X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-1-fdfc6ba663e6@oss.qualcomm.com>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
In-Reply-To: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jluheh2jHquG51NTxi5u7y58uVIJrXt+KUDjFXNRtYE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRSJG8l9WhVzcJGaIvfZQZhwes/GWQfGSiRMrO
 d6+JjqSu0SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUiRgAKCRAbX0TJAJUV
 VvHJEAC7yMt28QcxQv66SvejS2r0WMMK3pUR9tyCDRRNCdEc8e51XcJ+4MdDFNYJrfk6T4FC4ef
 j/1ak2n602Zl6sBghdwUIkwUtski3M6sNAhSSwLb7z0nENoa8t8ZbnGCHyCn+zJ6qkgnNU7Eo1L
 CDqdJ/Vuf8haY+CSaoSkrKUfayV78WusL0AqyS73gb0rOEWhieFGBo4CygnqHZqaStEzBrcYaop
 hR6K0k225hJMkkeIxMMxX2aOCYCSsoeLMYgKQaNzJJLJIYcBd8/SzFUg/6NM1MxOOWnvCdB1pUi
 +raXQsMXjiy4R0fbWQ3StjpfahwtMHFrwR1mm8oc5iiziaLSuX1e1YVApb6EQPZLaZpMXLtURhs
 INeA8imWu4589sGmSu0n+/8cSyB8ZS0nIVe32gBaYhesMHvjZg4iEnTf//6v6W+CX0RTGh9/3uJ
 lPoso5gXVkG6KHCARrMt/LpGDJPkOK5HXaZ7FnLsZaYY9w7I21E5+tcvDFjHWpsMUr5TG0cL2Kz
 8TMewOH/nTZIRcMHm8oiecpwULl+aURSJwpUwpyfOz4tEbnTEelZnX6PVrJ2kTgT9uufH4/poEa
 OI5vyhJcMaZ8CDoybjY7BjDzrW8nC3phIzLmZ4IFo2Bw45BwnXon6Xaa9HruX2shAawfYNYdsQs
 4uVffD9TW/zQXpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: oK_smCYMl-ipLMJLBkdc0o4ncg1WKqMu
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=69452250 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b9FoeKhDW2wivhjuwToA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: oK_smCYMl-ipLMJLBkdc0o4ncg1WKqMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX1p0La+1cHArK
 vAQX++SOiX1K9jfKAzPujSzeImhEiS6d2S1vJssyhp8YqXpSBaMHBhdxDvuWLBAFd4HOm72PvFx
 jvNg5FORbHk9cpptyG6azbaLSZEL58IsE7dUsjbSo/sKwdC/R1VYl2HEMGYCEiBpwjNvudKGVff
 rvMcmJWlk7qqwgsOYyP3F6xAh946tp8xfPLJ2XN/7zsAlnxsRzQV+A9pND2Xv+MxJ9+EPUdqLLJ
 TSGXpvwDSxmIze2aZv/ywQLWAbVPsnfS6BwKKpt5DrLv8zRPxKFh4z1rlX8fmgYmvKVuAUAbHbD
 30LPX8aZx9EGEwL0JRcwcu5nnkd2QBHxfPVT2KPUx+Sd3Dom4SyF6gqIjPdKRep5pW6fLuqPo4W
 4Ko0yJgxDkRWp2HDRUgw57Sb7U7xq8cFvAqk4rEeyF9TsD3+exVB88+aCpq7RSbDw1LaGRzZMOk
 RZpoKTwzRGACJT0ES9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190082

Document the compatible for the X1E80100 platform to the Qualcomm watchdog
binding. The HW implementation is compatible with the KPSS WDT.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 54f5311ed016..f2c4bc900e5f 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -43,6 +43,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt
         deprecated: true

-- 
2.48.1


