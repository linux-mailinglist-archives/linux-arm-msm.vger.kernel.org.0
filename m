Return-Path: <linux-arm-msm+bounces-115611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 50+nG7PURGpW1goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:49:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4016EB466
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:49:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MqpZ5A0w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YPQLuYBi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115611-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115611-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AF1E30A1866
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8433C3C16;
	Wed,  1 Jul 2026 08:46:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDC22C0260
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:46:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895600; cv=none; b=PiRAO1GeHnHyS6UVpHiFNdZpLyiAOsYR/i0aQA45sqFAT/8fLsOHTIOcwFLVyTN+cjAgIPXF1s6LXDV9s9Gr4ql8LsyhjtB4I7fxfb3LuHM88UoTNi6j6lCibvy0yWqiyTrfU0bDv7s0l7RTgVRE4RrIFF0zJkDJl6H8e00UB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895600; c=relaxed/simple;
	bh=VWNZfdQqzG7zO8m/ujQ06elAt3AMY83F5V5dnMeOC00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opmVOrV46onscmZwFGQPdYLBUQZ+lGwcyZkEAmTLWeUcnFEBgqQEtxl7jlJ+WDXmAW/BJB4FCz5rdoNELZvPiaszl+4csxT3lldcKLhyRH+8H0KwXP5zUf5cfNujd3OEWHtNSahCBa8iR0pcAec5DvTyxwHSqW/A26KILGRK1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqpZ5A0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPQLuYBi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GGt2497257
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXpwPOVHRUSUaS2v1xJ/wsTIPsSlu7sdW6vk2hWUeC0=; b=MqpZ5A0wilrNi3SS
	oT0BSRXaX1ByrSjMB5BwWRkeccmsQ15DXp3UhKJCpg2j2Zo97up0NPdWfWoTvTsX
	C6pBHmqfv6unyQQGxgbgBXni5UDm+oXmTBAdLfiYa3hLVMH9+DVtB1HSMX9y5S+e
	p6ei8K9pwZcObn4eL5zeS3BsD3+vmQLXCMz4ewgra2hxi5s81ohYqdUfZAK+Txoy
	BA6teyYZenhEfEYHlXnph0TCU+VcnqpfJbESprPXfL8L5penPu5vA7MsGJhS7MoQ
	JyfwMH9MOCakzZae/kpN/vaZpEoWH41nu2ZECXThFjtHv1ZlvTskXAHj5PUxOMg0
	PLjhGw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktb70r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:46:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed53abff8so680678eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895597; x=1783500397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXpwPOVHRUSUaS2v1xJ/wsTIPsSlu7sdW6vk2hWUeC0=;
        b=YPQLuYBiJN17WwzFD4mFlLlvzuEBgLtGWlrpLWclxxUu0wTu/9s2R9bC7xjUq74wXS
         zxl9cACK1kfj9lS8GqEXe7lhp5djaN+jRd1XeRaFb3vr0cnPd0eQ3MjCzMzd6DQHZjza
         xUP7l4Qrzq5II3QSC2dD+N/ATuV0MtHa+zDBLIIu6HOlOix+S1vtNzDzhTdzruPZPlcn
         Q8wuSufkJm9Bxj4/NYHAqVP2g+w11+gGUrsCiYnYZz5uIbvlI9AcbPGTqoRy8NtmJDJA
         UiV+qf32u3bp9UbgRnL1WvhGf0cXrZVAjhqsYDpiNbCrVvjqCCx36HTh7rvV8HreQZPa
         SUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895597; x=1783500397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXpwPOVHRUSUaS2v1xJ/wsTIPsSlu7sdW6vk2hWUeC0=;
        b=W3bbx3uIEB5dNSC8Sk3KWozAoKw8yYx7mnWL10UIcpwPlMivdsYyR8PEYQExH3jWve
         YktjiZLbeSDBul4Q/EWKg+QGh185AcF5onZHXrqavlaBbxEphHJXtyU1MOjAGZr61q3p
         lFCZlWT4zBKyemMh6hZz+B3pDXlEgiwXsSczYKJL4gZQV4tKs2AdBMCHMlkwRC6DIPOo
         dCU1hxWgETQlvW7tyF0OMa2QR9nJXQyhRelbXrMZ54VVs2dwGYok/qqj8JuxwMefmRKF
         hPxtiOHZIT2Qe0XOryh4F952BQx1mU5GTyIEIZ/IDCxLg0Ka678lznmFMq7Ta/PqiVvl
         av8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq4ZZtX3UEUQX0rL7gvrOgsKfpXGydrRY/+7js9XQ171p9QYJciKtayHJOUssHQTol7fSYJzfGN5nTvTEq/@vger.kernel.org
X-Gm-Message-State: AOJu0YzrymEa94pv6E4aFrB1SsQ37BuDYGb8RqXHpzf/CxbgWHhsnzoj
	FtKaB5YHcYLp7KtM0gsJ1TgegzyMxK4maj/SvMIQYbff2zMmV+1JFyckVCuJ99/O1y4EUPElcMa
	yERyOp50jPQ0teYF1kEnC0Yhf19jxRzXRvGJHwa+YmLje1CPAa8gle+ocsPkonzE5MhM1fEexFs
	lS
X-Gm-Gg: AfdE7clNkAhY99f7MSUFZsyo5Y5pkXeyC4QZPKd9/POMiJscYU3S1Trfp4JUIj2JMRs
	V9Z2kG3ISQOj8ZXK0KXCVqTgRgox4vpTVEyYgovA2j9RIZVl9OlkNRC06KRySSuUeC/ohhzPBqw
	dwexZLyNKAp+fJrKl49vNrTZzPhfZ84LnkkA7+Txbtg8xCT98xCcSO0g93d7NBdsooqvtPsf9b7
	tsWLpfh5RpdZ0q6r36dQkaMb4AZcgdH8iCSjxvBolLTY/HPt/i1EaBBYih470FsZBJmorFM0C4J
	YhDGbqOUs3RBhmieJ2nPSxjs+E36yhn5okTe9k8tzhZUoDuClOx+KTwHomnmublijDU9eeeXPSU
	Zor1EjIbwmSX7kG8psoQWnIihluc/iGyBMsrNrQ/ZKBErOXy+pHKg2DN5vOE7h9anZP1a5C1YiW
	X6m5Tqe+9JLKR2AyXB42je3az+Y+2JUWVWXkHTSAek
X-Received: by 2002:a05:7300:ed10:b0:30c:ab4d:3829 with SMTP id 5a478bee46e88-30eff398cf1mr907868eec.43.1782895596736;
        Wed, 01 Jul 2026 01:46:36 -0700 (PDT)
X-Received: by 2002:a05:7300:ed10:b0:30c:ab4d:3829 with SMTP id 5a478bee46e88-30eff398cf1mr907818eec.43.1782895596178;
        Wed, 01 Jul 2026 01:46:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm4891524eec.28.2026.07.01.01.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:46:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 14:16:24 +0530
Subject: [PATCH 1/2] dt-bindings: cpufreq: qcom-cpufreq-nvmem: document
 IPQ5210
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-cpufreq-v1-1-98656ad20ff3@oss.qualcomm.com>
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
In-Reply-To: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfX5UHAnzAJ2Ete
 WvWCDjgvlIIN6SeL4LVDFzlWKTiazCHq1Sk2zAhhmcko5DtUakNPXHDc6v3Hem6lHsuupgTLhGh
 fOwGbs5N4LgDmFjKJQedu/pBGFlYO+o=
X-Proofpoint-GUID: eiIHHI9Z9gwawWJZUqqfsHHCO-nX_Jrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfXxhVih0rRkfKx
 dt7ggkd8iU/+Ijz65SWnEjexp9jzje/QeBPK2o01Jj0Wal/U46sIyLR7MnjuSQMgPWLZ1c8pbrW
 qcQesHh+F8eYtrX4Y2WoJ9vDASaWohnHdI1xA2Gp1NLnZzuLCOOhzY/Nxf77yNR+BOMX12oKarU
 dpQ+JzxcqOLoiHVwLZIpxtYjYrq4IkYcW15kZrk+e+MJhPh5C6k8tKeKSWzWDERdV2hdLHdXucH
 BOj/3PfF0wZhyEUYT/gBBohIfWw/Fih3i4fUc/IejT76Hb3cRG8X2pY0MPR8/s+Hj5sAz0fgE0o
 LyGlID+RdSvZ7KUgeYsIWEXJeLtMLwudjqn1A2j6g9Um+BpRDwz2IJqVWKOPEMU6yKB3Q6HNWYd
 Y5kyQ2LFZp4qJf1+x8bbstXPm4dH8kuaScV6HRnaRBb+IyPMALEadea5YcA/inMSaZaHguGxBN3
 4bn0+B4emRXXgekvoeQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44d3ed cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zeNabaxW62Sqe8R-FXUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: eiIHHI9Z9gwawWJZUqqfsHHCO-nX_Jrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115611-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:ilia.lin@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD4016EB466

Document IPQ5210 compatible for Qcom NVMEM CPUFreq driver.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 547265b8b118..2f5dbb59034c 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -27,6 +27,7 @@ select:
         enum:
           - qcom,apq8064
           - qcom,apq8096
+          - qcom,ipq5210
           - qcom,ipq5332
           - qcom,ipq6018
           - qcom,ipq8064

-- 
2.34.1


