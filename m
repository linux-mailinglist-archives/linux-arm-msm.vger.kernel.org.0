Return-Path: <linux-arm-msm+bounces-106640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAL5IN+9/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:41:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DC4F528B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5E203020C2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5DB3CB2E5;
	Fri,  8 May 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3itWh5U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUVEXXwL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F743D34A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236873; cv=none; b=NI2HhUoWzBN48JMZUtj3FMt6FiSPsZVjUsfgbZIVZtWeAd3EeBVdEVzKILjgI6Rjv7FBNg8zYww3XJNa7eZLMpFFohmBiL5d4jyrjMdgyWvVrOgQUjC0Ao2qzEvAVzClPHdB+w/8B7rHm4YI4W89VORKYllV6kK3kVWAeqr92ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236873; c=relaxed/simple;
	bh=vcmzycQO+v5rtn0fILDKSKDqMmq9F3JiK93nKYTWSPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjq5fdz91GxZYiYlAK8c22vd7Wv8m+Uu57aGuPss9buxEFb71xdzCtUpcAbEEy93Yly1nxRMCOcTv71UtWPcfsp5cmN2UN49OPlAf7k0Zyfx1woe4K/P0RewOGOB8ZsT0kKPgUHtgPgCfqFYJFxCNky70M7cQ48fSyy2HOYxYps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3itWh5U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUVEXXwL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGrZ257883
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=; b=K3itWh5Ubpw2rK74
	lqy7dNT8ZlwQkgzZrv0eM2sPFEoxljv6/+QrWa1dZen5udYdCclHvcWgLCZY37Bg
	NCdlIJlBIPuNr5PwjaF8NykHJmAgNErKwVdjMG4H+0vrKLEcqtPdX9GuZEOruEgG
	e7q2CMH2vV7MKIOCHoosQfJMD4vL51gTtzphFlYJorugmq1TrQHpoRU3zw3iZoI/
	UUr2yEIDAwD1W1YLMROkmW3pTPF0lZs86waXdb45uflRN6seUqrOKyCq+OhM9qaJ
	0x+dsKOYT2IJd9e3G60iQGul1dqcYSR/VJGCpYfxbgR5XgaBm1xPZjPXGfb0mUIF
	DuEaiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegv40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:41:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba5f794825so16110735ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236870; x=1778841670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=FUVEXXwLR0dCy+9xWCXrqUyv9OCL6UBAIqmgHXaX0zpJfDLt/z8Y1UH9ndCepWSiZa
         EyA4XUK24dsHzJ88IA9XUmduY7zaS7fb2qNCSJIigvNHdHTb8pL82Fkjh6io1MeMto0Z
         +uVJAKzDkqFhfNMLr4qdXYjLtbsMA66NjUfpOgrfjy54SMgUvKDbW0LPYxeMRO7qmlJJ
         9qMIwLERoJuKq8gAfwiMfJsSpNYgqgQEAQp4qWnvpj9rn3Ghf/83QT0SqdTko3wOoitP
         C4Atl8go45ZcVqUobCE3BZSWtYZwQNP/C+s+cMLwe5BOUUuYY+y+1XKyZ9JDX/kbMW4d
         GSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236870; x=1778841670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=adz1o4ZBTWuo8phpfW0ZK4II9PsqllnuD039Ja5tvHv/EFLvWiKS2eddFBBEgqajV4
         hExkmiqP9SsZtMXN6uJbaqwIeOFBrZ2X7AqBcLjBwNLovT3B//q0bAqjEnIqUETeGjY0
         CQmvd7Qg1RQ0pLYIEZUK9k+YqTX+SO/cFFxI0M0OAZmjW5sDmafQzi12U8M7Yl6Vg9KM
         fnxqnZJL6BnGFJHOiXTpqqRzzWwerw9WI9rRJ/7/9AuFMJB03S4YkTsg3paNiNw/u1Dt
         pweSkAICDv1ph+TsVhvZGpwtPuavPgSB6FdZYQ4CWXZntANT6pAFi3MktdpXZ8xcZAjG
         OYCQ==
X-Gm-Message-State: AOJu0YwssuZRMgopeWwxZE02KZqfKrgfbYVWsEKWHnoQoseYarcv/L0x
	cW1oh7QabkSJ9fsTU1MBQg3YgQ0eKF+aMqEEp3LhI0+H3ozuzV+g9WXsEOVRV+05Nr2aXMMQMw8
	rVf2CiLxttqsHcVY6kHVKA6jEIzDczhxSq9SZUWqof/mIYP4lHdhJBY5pOsFTnW1EgK0Z
X-Gm-Gg: Acq92OHgL0tRc9oYI/WuNVXFawWsc61JH4Q613Pr9c6FzDHLwO+udkOR96A3KFsuPa0
	LURqauNo72MahDICA6jeDYXqnrH6F5lgaXiQmYabKQu2DL8qd79dVU67YrI1lm04gvJIUCBgP4s
	EV7r+ON4vOvdCCid7zGI2DYCxP9JqZHjZf2jfHQqGHU7v4jtNU2l3yLXaG16MiJ8Z9SmpRWVPFm
	5X3LKfxw3W49jcow7rOG/v0BABlHm7FtswKFjgoAH17ETAhSDwLDShMYqMaP4BdnrxTlfxjIQs0
	Pvx9uXxwZWNeGZTgKcd9qajzggB0v9G/M5bUd1si79x2nnvNpcVh3VVvNIC0sn6vWwlmZvq0eYQ
	UydybI98sbEy2yAlGTk5F5Tyn3wb/Dz85vBsOCPXpFydGSmYOUr8=
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2ba78f7320amr121388795ad.16.1778236869932;
        Fri, 08 May 2026 03:41:09 -0700 (PDT)
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2ba78f7320amr121388555ad.16.1778236869455;
        Fri, 08 May 2026 03:41:09 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:41:09 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 16:10:47 +0530
Subject: [PATCH v3 2/3] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-2-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=962;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8hvVNB5nM53jnXbcU14D0R9X7GK1i2upQQ1liBM2/Vw=;
 b=TdD/3G7zPaJCIrQYL5OupXjbI71bA1kBr7f2NF0gIoY+oc/Q8YE8Zza302+pQS8Jkb8Y7X/6d
 39RS0c7ksNPDJ2wzEt5exS3wXVmWO2Ev4Q2C8Ey4QPJaoiNdahDXgfp
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX0cCWJFbnSSkA
 z/SCkW54QYwL4BUWYoqyyx2N2f9DHEADR3Ki5rKndmEZkCXsIV7zyiJe2vVw5oznv372mxM8+8h
 Pqs9UA7l7GAqpoKkxUam54yGvL9shWIWO625f325UgdgCkZxoGdnmN0+aIpeQoe0qnjJibTmz/z
 MuM11Q6dm1O6va/S6WE1+ltwPJgCGg6TmefmIBtwmVe62Y95zPYZ1tD6RR3QbI7EXzFI8BTjuE8
 kLjv00hmLMbTiA/0JjyVBqmV+PJKND/L9PPFK5Wkx5xWdtzElQok7pQ07CE6kA3WMiYTpM9550h
 cA9EQ2OWfhDf3XPAJUw3+ZHMFq7WHW1mhA7apQW0Y4+F9ae+kBAQABXAqdVi0sMozNanta6y4Yb
 /iK6XBjHOpFu54FRajasiGFcTDheY5fiqrLOhiwnVYIE7MGxVwOwLQsOhowaMRKl57zAPm7dJf4
 ++e7aZ6sX9+0wMp2P1w==
X-Proofpoint-GUID: 2BhQ7QATBYorvEx8eaMNVO0VZAxBFInW
X-Proofpoint-ORIG-GUID: 2BhQ7QATBYorvEx8eaMNVO0VZAxBFInW
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdbdc7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zr5sphF6OBxrw6KR-80A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110
X-Rspamd-Queue-Id: 6E3DC4F528B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106640-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra RPM processor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
index 540bdfca53d97d9c18fefeb50fa68fe704b2008c..823304afaa98f8acd67667c6aa3e36ed743ef554 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
@@ -87,6 +87,7 @@ properties:
           - qcom,qcm2290-rpm-proc
           - qcom,qcs404-rpm-proc
           - qcom,sdm660-rpm-proc
+          - qcom,shikra-rpm-proc
           - qcom,sm6115-rpm-proc
           - qcom,sm6125-rpm-proc
           - qcom,sm6375-rpm-proc

-- 
2.34.1


