Return-Path: <linux-arm-msm+bounces-112043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lax3FMfJJ2rp2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9465D900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:07:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HNvNoYyL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NMy1rzqX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112043-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112043-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C878330B7410
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6866B3E7BB3;
	Tue,  9 Jun 2026 08:00:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222982ECD32
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:00:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992043; cv=none; b=BaF5bG7IBTjURRK/wLloqx0o4S77mELyHkRYZQcZqOAm5RpQNlmoyAUDRlFg+GdyZIrzcTXqEUEVOEC3feAexFMOeblEpH0bNKEdJcIJBObWqfalKebb27ATgSSpldlfKwEhX+bbUHmqkYm9lCKHLNwvCWPKuwO43zucqrPiwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992043; c=relaxed/simple;
	bh=GUd8KmrY6YvMPNUJd3CYw8tyEqRQsScJ1bSUPwtgd6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t6fnQEbASfMpQMoi2RW9pnb9EYoEcCqAWX1bntMLxcTnY6gzpcHOvdJts521hDuWcgbsD5clO9wdX+rKMiSzMJhtFPbNQBgHBRF7NHxqu8gK9NX5ZyTECQESlUPUdIafOn1fOKnrcerq/03s6i68o359m+Bo7kZpB+gjy5Hc75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNvNoYyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMy1rzqX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rbab1923228
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vQL1iwRWwLr53GF4TzTp7Y
	TossVt8/CEfh2zZGXZXJM=; b=HNvNoYyLH6161KwvICPj8ReDzkcsDcQ10FIDgv
	btduvwKShMSzr3ACTmqaE8g0zPp3bd+1JcWiVCMvT/ltfSd0NSI8zAvxE55z9J/S
	t/KTEtDsxIekiIiyhnw0o8Xiw7eHfsSHPX98ARHVkrNpABJWSXqrQWEUJqJ0PWXR
	OAxFUOC8pZ3zJ2m0xFpE/K6VxEd+oaSHGIPX92ykiZRRJ7EJ4jncmgi9CeIEvQHe
	aBQAi4aCn1ZCVFIUV0EeiYd5aLZcgS/e/ppP7ANFKHXcleu33SyrTp/qutdb2ViK
	ZsWN/T9ifohoHOdyl5L2SOK3TZwdRyOFcatAe4RIhieRyFAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4g4qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:00:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175b7946d5so43489111cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992040; x=1781596840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQL1iwRWwLr53GF4TzTp7YTossVt8/CEfh2zZGXZXJM=;
        b=NMy1rzqXZWh8VLhMj4lV+w1Cp4k9/X7EUuP/95nAg5/u364SOB0EYH9/MkV/mbavEB
         NJk8qxWv8f9ACVdH/9v8HA20FkTm9oeY1EodUwUW6s5eAkHvQwZFJtK2DX1XriGF82A7
         JSohfVN8cvEMyusyV2mjmtyvSTt6cbzu1QiJmFneoPyId3ARgj7boXRX7USo/4XC+mNm
         SpMydIc+AeEsCz6SvQztrUeNNjwUG5Mn7egUr4FhMwGl63wU66cXvnnTYHQi7lOhekmX
         /O21eT8uA8r1b3c4k2au/upMuDrv7AIgw65A5Nm6oalM6xfICLTYAUgwVQ40DOJuZuER
         /BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992040; x=1781596840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQL1iwRWwLr53GF4TzTp7YTossVt8/CEfh2zZGXZXJM=;
        b=smVDyj5+bUSrI7QBeUttwV4Fb1EKvSy6F0UfPzr8YCIERvaOkOBuB9ZfY1QhvVwEe3
         lb5aiO4bYle/lNaiqa74SdkObJXqAt9ZxMjPsFuBY/AM+ME8+pKqeIFn3KPLr9XgPUqV
         0L4RbcTOlV+7sI9Vvsnm8pHgZm84yFWGGbEF7X2C0RHP1dv1qvxeMVVrhufH5AZQSNvr
         dsktYKjyIDW3C5tTHRDq7pUjIHCZ7dyTBFOqNvZ/aMmhrL56jQOJPqrJp9G4TZe1ywhk
         tjTRfYdP+v14Z4lNtVtupRnqiYZwbkG2wP0SZ7ByGT3HbaaL4g/38xgT2NzEFIpLnT5i
         p3Kg==
X-Gm-Message-State: AOJu0Yzy059QWCAHXO52J5rIMH8wA5W90NmZORxGVCS/itehsShAnuuO
	tCQKImOMBsR4xbAjVl2B8UmSf0Aum46RD8cQ9bzsKfYGGQT1H5YJiD7SZWiqv2gAFQ7OdECkeRs
	BKh2e1vIbhCQ/34Ab57xsFFBhgOGpdd6KPV9o7Uy6eILNtCanhFZyrWt9BOdAepIrMPJH
X-Gm-Gg: Acq92OGMyZNVoX8lgZtorCksiIqPMhKV47HmvQzq/a6XTqeyG62QQyZrEhMQ0BnNee0
	Ij12CMD+iCXcZsklpBqCkGiYfssX609HM2ReFLz8foV4Nc0XMU7VzrDMPAjNmfWnriSZ/p4SMCi
	u6cI1ColV98og5ahsUL97rjfNkfuz+HoTZrDRbRFXOyyy5rUv9Un/vJF0/ZfkreAw/Bj3qwHxkD
	0f0fmi9S4ZHO8sAAi+O99Ivc9FCEkDbtSsE6lyZjqm0rTAwhsecZzDcFHicv99PKPVU0uelnqsB
	xOZ1em2vcT3jIgRCHBrkksDSS6pMXR42hELE7qEFUtcS1HaqimAyrc2TqPIusOiUyAqfwSQZS8L
	lzIZXMa6PgwkTWyU1pWX2YZxitNlHCMnY26MY
X-Received: by 2002:a05:622a:1c0a:b0:517:c6d8:780 with SMTP id d75a77b69052e-517c6d80aa4mr46190011cf.56.1780992040230;
        Tue, 09 Jun 2026 01:00:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0a:b0:517:c6d8:780 with SMTP id d75a77b69052e-517c6d80aa4mr46187951cf.56.1780992039523;
        Tue, 09 Jun 2026 01:00:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm63605930f8f.34.2026.06.09.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:00:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Tue, 09 Jun 2026 11:00:16 +0300
Message-Id: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDIJ2oC/22PzW6DMBCEXwX53I38w29OfY8oB4M3idMAxWust
 Ih3r3Fy6IHLSiPNfDO7MEJnkdgxW5jDYMmOQxTqI2PdTQ9XBGuiZpLLkhciB3zYXw3GE0wdAYY
 vqC4iF00tZFk0LOa+HV7sMzFP55emub1j5zfQ2+FwmmOZf9lYqwmhG/ve+mM24NNDKix5zTbEz
 ZIf3U9aGURKvAcVO4OCAA6VKBtT1VopFJ8j0WGa9WNrOMSToEH+BzV7IBlB2lSKq/ibkfkOaF3
 XP2z/PT9FAQAA
X-Change-ID: 20260514-eliza-dts-qcs-evk-7f1419812659
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2319;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=GUd8KmrY6YvMPNUJd3CYw8tyEqRQsScJ1bSUPwtgd6U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqJ8gZk94kvJRyae4qxbp66nnRVao3x1JpJYWTm
 JYoEahmjsaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaifIGQAKCRAbX0TJAJUV
 VjVWEACkORza5jtsMdTkHUaOOc38bIm3pUuHhLEXNxGi+oggIvVhswL5m6WDZCFtKkmf9i2z9um
 hOO4GKYtW9wxkMIylOK1eddUOroLhP6Susa+Hd/WKst3TMUOm9cM89y2BNRMEexcjXN+Tdsok4m
 2R+sU5wDw1npgfN9oxbkMn4ACK1qzDUPThR07j8CEy+PV/rEzhjWY2HazwEaYs6dliyF/Lq3kkv
 kCsHiwY4chiHvz0GdLPWwfAPNcn7YnIVZm/VEMIJSNmocrCTthWLUfmX8+AsDc5VwVRg0xtfnGJ
 dZK8CYCYoUg0gS8+ShjOj4lcON7Y91vbwPm7Jvh4JjbDxoK1TnANYJZUL8qRPjF/eBxT9UYSpzn
 zCyymEWNSu1s/fkK7IanTNVLri1zGrGJ6S0PAIEML2DfLbT9eZ6x9TrxQI6ACR4jbWq8ynkvw3c
 sopHJkcODxOSv+4N9kJCJfCbfKcIaDZqKFd60NjWZ+P7dQ9pPIkMZBqyLxt2PqDq63dIVtUG4Hy
 n3yoIdwzTWVjZirGJT/UzFqxXHTA9gVE3JVlHpgCAnlf6Kf8zsJzyNpbcyhwsOd08qcaMXSkE9E
 xZKicBufn07kW/lwiSvjP3W4gqKDuIIp40ggwL8WaGw6Eedatpz+dnuW574RnLvrB0IUEgUUYYN
 djB7QOIkNZgTPPA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27c829 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VlEDaxusOxULEvL3EEEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: e4V0sksjLpz9UPSg8erBou4BxY7Ml44a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX+7qthHqrRxQH
 WAWjq8cWI5nrpQBBjq/RYYe/JoNcGYyFNr6Qw0WJ2U9pVFLucvoWdhfjQoA0JZgA4lx4jktFD8x
 e98WDYrDnXBjt44P8Ul3kiVoazkPA61hJaQETimOU+fOp++/370JDc6+Nt58mXIiRxf2zNs4WSB
 a8+KHchQ49dIBhjpTqmTwDIqDsGeIYoILELTyISg4nC256kcdEMjERuN9VNEW45OpB2XhMEbupW
 OATUba/Vl7iM9QX5WVtBHGlNnzuNbwvmQPk3wWt8XceOzSCA0k+Br+Na1hO2Walx8sLd5MuS3mb
 tSpVlPgjLon9OYUZLbTANdXQV4KclVM39ZT76w92l+cXg9aAMFKYK93goYiXZA8mPU0msXYIP9a
 RXUqQ4Pw4H+HpZGgW+86G8hEusF4OpoT3fBjemmGqWYe8A6VPy+Qixi0YeEeqjEDsDC2ahemvEN
 V5bVVgKL9YVvHMbqGsg==
X-Proofpoint-ORIG-GUID: e4V0sksjLpz9UPSg8erBou4BxY7Ml44a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112043-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5E9465D900

The Eliza EVK platform is built from a reusable base board and an
Eliza System-on-Module. The base board provides connectors for external
peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
eMMC.

Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
Eliza CQS EVK DTS that combines both pieces. It also documents both the
CQS SoM and EVK compatibles.

Do this in order to be able to boot to shell with rootfs on eMMC, on the
Eliza CQS EVK board.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260608.
- Moved the gpio reserved ranges property to SoM.
- Picked up Krzysztof's R-b tags for all patches.
- Picked up Konrad's R-b tags for last two patches.
- Dropped all dependencies as they have been merged already.
- Link to v2: https://patch.msgid.link/20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260519.
- Added missing qcom,eliza-cqs-som to the EVK dts.
- Added in the bindings patch, as that should've been part of this series
  from the start. Also dropped the CQM as support for it is not being
  added. Also reworked as Krzysztof's suggested. It was initially sent
  separately here:
  https://patch.msgid.link/20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com
- Link to v1: https://patch.msgid.link/20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      arm64: dts: qcom: Add Eliza CQS SoM platform
      arm64: dts: qcom: Add Eliza CQS EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts      |  14 +
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi     | 394 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi         |  20 ++
 5 files changed, 434 insertions(+)
---
base-commit: ea8a803d3ef1bc668d777516e00c3bb478d17c23
change-id: 20260514-eliza-dts-qcs-evk-7f1419812659

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


