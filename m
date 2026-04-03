Return-Path: <linux-arm-msm+bounces-101606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G6UBhtbz2kXvgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 08:15:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8D3915BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 08:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7C51301DB83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 06:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C904D372B45;
	Fri,  3 Apr 2026 06:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZ9BiGrv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5yqksZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED44361DAB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 06:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775196925; cv=none; b=RlYJpJvWYdgCsbrazbkMNORI0JUTSShtZPsLGx43rVFmUJkNzisM4ouUIFC4rWTEQ3NXCxtQkfMRHwOMjEUMA93oDcSYWJYHhl3R2+9UzUaZ3Tgbez8LRKVrefvhQLdkjvMGLk9GuefvvDwxSh3UzSG8kGzX2yKtiYqeEUqC4NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775196925; c=relaxed/simple;
	bh=rQ1XWsAwABRLSc/df9pK0AK26PuDQCJmC0LIkUBuomc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jIH/sejjHsvopAS+PpEJohlWksInRsYOUhbvNfqapdiUe57UhtFJ8y5AXXTRyURQ650zPG+GjCiXDi/TKhEBIbllSKVSTSZ95Tt6uo7peaZHg/ud921fPIddB2ZJw9BAbkdCFy+mPP1XQhM93blSCjobvXJaVN0yiEg2IqZ4+bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZ9BiGrv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5yqksZp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6333Ahv3981428
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 06:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6BpMBsUS3gROf4qM7aBvUfrbuUasghT9uMQfBqZ9Ms=; b=aZ9BiGrv5O13ScBv
	tX1RvCt0/i6EGzuKrPSGeUiZELq1Eg7qozJg7lHmgAbbBZiShMrQoFsJ/hqQVhFN
	lRR3gXA4o2qad93P/oTUcQ7kAfMeZBHpgPQ4M6At5x8blW8fd8yuzsvvxdp62Rce
	0aZBwH+dn1hmIktR2zPkx94c/KIEluEmHpEb5YkIv7PwqGQNuOa4Vmak1INfKEoE
	TFnRDEcMIYAfIY+aXMhRHVXFbf4iLa+c6reM6ZWLX/SJDsJUOoxbB1o0+1Kcr5VY
	py/o3D9HjOYEDbqTIAPFDL60B9sVTeX3nRDdSe8UqDboT9iKjjnhqKM2zxWiJAnp
	3GVLLg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupteba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:15:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23c909256so24116685ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 23:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775196916; x=1775801716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6BpMBsUS3gROf4qM7aBvUfrbuUasghT9uMQfBqZ9Ms=;
        b=S5yqksZpaOSAFgX5+1P+j/Wd07jG6SU/Ll+Hw2iqFq174LvwFTdRB7qQyS5KUPIzUD
         c6BbeU/4/Gau2ejJAMVDob+6GwM3lqwRJ101Yixy5xZad6yJmow/8sufJYfvPFDmdb4G
         5ybqiQTaaxzjUpFBZ3BqKP+tg/DwtFs/2/THS5X+e6kZWVQPgHwPNWHXkfvJzQEuuWqR
         EL9zRhkaAcyD+L2RaBErzjQwCUGtO3k4kJM1Z54XDqEZvOZaz0JSemDRJMytI8Sl7c4u
         KRfZsSMucmN5gkOmGKEcEzewRqPEkklIiF8C4/iuJ3pa7UTge5mQHtCm3pEEHZjqDl9n
         GtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775196916; x=1775801716;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q6BpMBsUS3gROf4qM7aBvUfrbuUasghT9uMQfBqZ9Ms=;
        b=JzCqWkH+hBCZdcUeVpNZDpjYUR4AgEU9FiAWyW3h0oT5QXf7e2vOTKb1QeiMuDVLZq
         C0QZfhqoxXq+SXPSK3FeFFxHlVYxsOGFZb55kkRq5YlWUKBV1lRon4oQ6rd+3j6HvvIr
         ZKk+EiyYvrdWotpL6nwSht08xydc9tcf4/t+3lYk3f5kUVL5WNzKIqp5hpW3WZZGnnom
         Pwi8D6maddsi4Wfsg3Bj+pEX0JhcjYbpXrirMlkEaTDsNo15pQ3PNonJoDblAdHoaT8B
         y2ao3nFOrDE/66kOWEg9PO8Dj6CI/0Xxkh93Tm/uDGONhQy+7ma1P9dMOaV23zpyJBuw
         NdNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZZPZP+8gQoJn+YYmd2GW78FOAm5ZOC5lfIniyUxjQYtcjK+pKYaeLo7eEcbChUgejJdyAO8WKI6Y+n3Ag@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1G5yb3s/Hgnr/KGOe3TsaLqBK4sX4nvLFeMWcf33qIAsC01u
	dtGzTIiOikjjSYu//DCbPXWIqm38lv7lYg5Q2WshRSfT8ns6HhFzIxLiQdfGL63ZX63Otu8M4qm
	R0Vr2Yh/Rdz0HsawACVESnYYcSSBp/4jp9mHL/LNR/eiRS+FnOevxYNu7jjcklbvNVMUpr0WzsD
	xf
X-Gm-Gg: AeBDievnK24Hj4s3gLC3sd04pEEqfK0A+5wVEQoBp7Atfftjj0/KxOcBZFoRMDaIPgr
	aWNKnGTbk9IXhTn7NuI8Y+jv6h+3Fx8fbQ77gCLEgaARCsqW2E4pfUTs1MHi+PWCN1bynBNjrx4
	2ciOz85S0BvOphgQHI/h4+8vYLdf5wEc8PMlECtZTZ2kQCHxLURnehSIK4Xp65aZ7JLS6bs+QBf
	x6EFVgtAPaSwy/2ifyltoHSnHLF9+2dl+lhORgU/Hzkb1b/BOf8UyFwSMUyXsKUd61QrQxqkbqe
	9NKxDkfDykYFJuq5OfscPf9O2Juuv68rb7Zg66mT5Uf4jdBBvoqlm0P9RM/dOvhFZTEco16+zYH
	O4ZsySuTumctr9qxViWW8hlVokj8KqZVapRlXO8baOA1jgBU5pQ==
X-Received: by 2002:a17:903:388f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b281789c6dmr21981195ad.29.1775196915898;
        Thu, 02 Apr 2026 23:15:15 -0700 (PDT)
X-Received: by 2002:a17:903:388f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b281789c6dmr21980835ad.29.1775196915388;
        Thu, 02 Apr 2026 23:15:15 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.79.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d688sm48496095ad.8.2026.04.02.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 23:15:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260323122837.3406521-1-dnlplm@gmail.com>
References: <20260323122837.3406521-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE912C04
 modem support
Message-Id: <177519691326.6771.13975361277585355648.b4-ty@b4>
Date: Fri, 03 Apr 2026 11:45:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA1MyBTYWx0ZWRfXysW+xCdeNVIm
 RoxVRriTVmYm1say5Tm+OGNRE/iwCEFRaZ6+N019a7ejgcdsHhQ4nnLo3Z1HRxy9kfw531EAEb/
 NOfWuEIL2KZZiLGhWNoLxbwvJTvdEsPhQxQXWctGbJn5RMzGWPNL8ZvG7sv5nNZ1cpD7SUKE2Ng
 Vm/jCVHpJUcks3JUAuTR/jbF/ZkF0Hd1Loz/KFloLvjaHOljYtAVf0F9MXPbVkBJ/VFIuD0oSRH
 98ts0VvMkYpsGdAxUPzuiMF4VoIj4lJMEs884ZqLc2q6Lyh88myz4aXhk3Bb61B3ng+FbAbfZuQ
 NdZQv8QKsCPkcrlyCGWegKSpStsVSQeHqoK9JSq1CU3wyLxYOuKNQi1tYaFND0xdlIygUBgp/pQ
 ZRUhsqkC/0jRKLp8qB51/L+wExCXPbUXwnA+1qM6/xNp+TvggzsRpOdCC8tezRxL2qprVSP46SM
 83LoOzNP6Jc7wZ7fmEw==
X-Proofpoint-ORIG-GUID: dMcDaLkKsw-5PgiOujKFUYfcrT-ymDVW
X-Proofpoint-GUID: dMcDaLkKsw-5PgiOujKFUYfcrT-ymDVW
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cf5af5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=+KsUAYeLG1mN9JXONzlAbw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wTo5TqLFWbBI3rTarbsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030053
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101606-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FA8D3915BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 13:28:37 +0100, Daniele Palmas wrote:
> Add SDX35 based modem Telit FE912C04, reusing FN920C04 configuration.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>         Subsystem: Device 1c5d:2045

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Telit FE912C04 modem support
      commit: ac12b852b4ead4a586299c8f68cdcbcaf1bf6cbc

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


