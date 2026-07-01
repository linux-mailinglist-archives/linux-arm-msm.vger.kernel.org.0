Return-Path: <linux-arm-msm+bounces-115610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aDB5M/HTRGoY1goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:46:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4FF6EB3E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:46:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QxTwa8I2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YrLjeaNY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115610-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115610-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2CA5300AD9C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A513B83FB;
	Wed,  1 Jul 2026 08:46:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0534DB52
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:46:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895597; cv=none; b=XYHN02ooOmp4cJpC18aSp3KcGbLLSXhKTIzWTswaz4LfNlc8Tn6x/mgf8lq4BHq68Yb4A2lEJr+n3EkamcGSeno3eU9OMYReYWG3Yp/J0IGL1SW7bTOxAl8GQQm2AAFdXHDiFoYBrLIwxPnsSoWelrk5jMO97bhGnuKOH+tUx2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895597; c=relaxed/simple;
	bh=LcV03W46H6g3SUm1iaLCXDNF1twNf9lkDV/Hbq5M6Jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HUdxVcEO83WNvSr0RGLXG6h3MTj19qRhJKub92LiMB0gMdjvULXa9QNinqzdjNIEwvVCJ49YFWNfZN6I2ogcvZKpvn3aWvk1kTFM81g99xuiW3p7aO1g8XNWcE5CCK3IErL6VRO2KJ1HfF57ls47ux25k9J/OowGfXBCvK1eydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxTwa8I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrLjeaNY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G2wX455977
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lP3vinKQxRygXko5Q2tIE0
	8DQYBGJ0utHSduZUN2bnY=; b=QxTwa8I2cnjQnvsCCOWWO4mbf+tzTQypQNfMWl
	xFOOEfkc64hKnH64WCIze8Adjq/fylI1OC/gBIVVLPnR+bslVDVEE1m1ICwIOu5/
	y/2jHxO3y+5KvageeJbKw4ZrutbxjZr4EB0txR4wnVx4HVDNUxN9mtc60BKK/Fm1
	CNAuLsC1LEwausxbw98t7NK2G8XFAeNgWZj0+DbNwpKzXFLzKqFDp/G7Zzjg9Phv
	OB0/2CUasRtlz5vH8aOifa0SSXE/wITgYcjMqi29rJOlMbhsfNMAUouyf3e85pZt
	MxnlN05YMxln0c5KuKRvDG9ugsk71QWqor9tv0bZb++Air4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwb3v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:46:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ed9113e03so177498eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895592; x=1783500392; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lP3vinKQxRygXko5Q2tIE08DQYBGJ0utHSduZUN2bnY=;
        b=YrLjeaNYRvi1a/ObQw9A+dpvW67gJ80E6N8Hg2vljqAdXg+LA47OWV/6xIK+FWEyj5
         c5SvpfIn2GELD0aDHRi4vBJWdjYMzN2nHnMu28sMGKHGW0SNOwcp/sCPSJklBAKYNIj5
         J+xAb0rElqF5XCl2mECnnj16v/Qe2KoApZXPCi3YPlMooLYKXDwxpDPENUg5OeDoyesI
         Yn/NhYfrz8U+2fr8ngqlcASHs8/MvF2MhXWdgu5uGnR0FjlsBgRUFGXEFgCPnI+cr0vd
         +0NNyRdFC7rhx7itAwMA7AJwm9f8lAXrtYLHm0bUJFuwnbnjIymD+GcQo3uVfpTFOexk
         B6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895592; x=1783500392;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP3vinKQxRygXko5Q2tIE08DQYBGJ0utHSduZUN2bnY=;
        b=iOZVj4vu1pk95P6aj7RGcj/vn+azoSJvlYCMwwjZnnnybaCOhL6xmNgkKawe/Yo+rc
         5E39ryTDRUD1SespmCsB/0sO+4OQI7ytVoyQyPtktFiu4x792VsiGBD4gnZ65WMzGKc8
         WKvVtABwJTuM5urhe64FEdLDHFS7fdVOez5aXfNV5oTZDvep4/JUZkQrS/sL5L3mnKTY
         RP8ayWThdaRCxguo4Y5HEPWIJxOirttS8X1Lz4uyBv+dZ5ZiEnrKNe7+jRHPiGwK/8Wq
         BUWHQ1HiuNbDzRwwm9y6FGfDCtWC7pKr3t+t8+H3EE8gOtPzB2kKxVuE10XJaR7b1463
         dkLA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/3ZqX8DdL517JOhe6mL9LItNQnLUn1QMUijifZv+xZ48VKzAfmK59bzzOGw7N00+4XEimELR+Nv41AKHi@vger.kernel.org
X-Gm-Message-State: AOJu0YzyJH6sJJcvtnXLoAFgwykyvNMGN7TTsBJmZxreOxPqTTNoHSl0
	leh3D5+eQS5h0mecgoyD/5YJgIAQPXSAcE8RHOozVv790BVLgC8+tKmXh+wci4mpy6z7iVihUjI
	87V9WF2wcnspqBfp7KWfuwT3xZgk1+LCGv9r8pIYPjWYZ7ADqARGWC8Gs4ZRoCiAPlgh7Iohqhy
	l2
X-Gm-Gg: AfdE7ck6BohaiqY3ah38i+jtXvAp8mkz0UPxO6wHgDMUPi2TFHburiFcN+VXqEexQxr
	AnAcygixWLPj3hlUlq7RN7Vz1NftuPWeWBxC8dsMIP3aOkmnppxruKRzm3/yNSlrHJWwhksjhGy
	qrdoRVaPfXbGOCo2cSsyjg0Nf/iK5gm0wsyaPbm2XdO8x8nfkK47PidwKk7NmKPnxHqScb/44Ue
	aVwt5oz0zb/xzAxUc3ixhX3mQ9SlBXP4owSWnCUaKeuDTFGz6pjpmFwHZRs2BAjSTGJdIntaTiM
	JIzsC+C30+PG7y2JqwEchLKjPk5pJUvCuQgt7qVggRwUMGhfyXppsajjl5UQoL8QnYpjscqswT0
	0dtUTmJL60Iz+ShjDIgTvvUXn+XMOhI60kpsX25e0yW9tz+YrKx1kFs8cFx5DBx4bqvO+oyhqVW
	K1zJ4QcDLXShaEUVNd8wjc4PTsq7fGL+0fHWvmsLzW
X-Received: by 2002:a05:7301:3f07:b0:30c:ab96:7302 with SMTP id 5a478bee46e88-30efe949021mr955951eec.18.1782895592440;
        Wed, 01 Jul 2026 01:46:32 -0700 (PDT)
X-Received: by 2002:a05:7301:3f07:b0:30c:ab96:7302 with SMTP id 5a478bee46e88-30efe949021mr955914eec.18.1782895591825;
        Wed, 01 Jul 2026 01:46:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm4891524eec.28.2026.07.01.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:46:31 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable ipq5210 in cpufreq/qcom-nvmem driver
Date: Wed, 01 Jul 2026 14:16:23 +0530
Message-Id: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/TRGoC/y2MwQ6CMBAFf6XZs5uUKhj5FcMBy6vugYJtMSSEf
 3cjHmcymY0ykiBTazZK+EiWKSpUJ0P+1ccnWAZlctY1tnE1+3kJCW++wFbX4O1tQE1azwlB1t/
 p3h2s2aLDckh69Bnsp3GU0pqItfB/eqZu378BV+/LigAAAA==
X-Change-ID: 20260625-cpufreq-4e017fc09de5
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: -s1gOeFzt-hLK4pRwWtpI96Ux_e50ns5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfXzvl/5/MUIkXr
 zUsK75Q+5Pd4iSf3pIidZesY+7aQES2ou/NOppsOu2+KjvTyFXsUaS9Euw+NjsYiAndIDv39+k0
 G709mTstpMLN3eCQop+E8bE8XtRfvMk=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44d3e9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9X8JnDGoADxzNrPhSwgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: -s1gOeFzt-hLK4pRwWtpI96Ux_e50ns5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfX+b4GA/5oURQr
 D92T8kSt+FH5x1w4J1apGS5ipwJlSNzKWeHxZuJL7zftL9y+TInyYyhcsiPs7PG1NfY7G6esDYz
 301H2hjjcTTSesy8NOfRcGz1KtADBIEc6QEvN0kEFguN09vKcf5HCVdI6mxjt6/8fjYqhwQSV+f
 AcPfkFmOcy3C8aIlK7N4FFV1wNxUfMvdiGnnBmnENlbjD5h1Ir+NqbXK0yl6m1zIbb/Z1WwWw5o
 N+di8f9g9MHJabcJ+k4/7WC+89gDdTf7t3SpV+OsjRdidHRU6azX3NJKhn0dHtNFgZHu3oWbTwD
 G0SbgvrN3AoaTUKsce55ypMrsg881h7ghfqEkyU2mWA58ccaPcIV3NRC863brMle2UCwzrlaTgo
 2VmMqxVX7TcbQzC1t/UBspvOfrw6tA3gBiC2lv9ZPrzRCJ1KzZr0aO4LGLjVLBJDTr1IlOZzZJs
 heYLCqw4ltOShZpis4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115610-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:ilia.lin@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: CF4FF6EB3E3

Document IPQ5210 compatible for Qcom nvmem cpufreq driver.
Add speed bin identification and match data for ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: cpufreq: qcom-cpufreq-nvmem: document IPQ5210
      cpufreq: qcom-nvmem: Add IPQ5210 support

 Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 1 +
 drivers/cpufreq/cpufreq-dt-platdev.c                              | 1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c                              | 8 ++++++++
 3 files changed, 10 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-cpufreq-4e017fc09de5

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


