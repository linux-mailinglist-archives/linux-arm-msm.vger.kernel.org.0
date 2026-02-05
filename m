Return-Path: <linux-arm-msm+bounces-91877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBtBGNpghGng2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:20:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9E2F088D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53925306903E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D34E36F40A;
	Thu,  5 Feb 2026 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xlkf4FSS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+JXlYB6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AADA32C333
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282099; cv=none; b=F67T3epXbAxKEl3RIIYV2iu2Elgn0voxpvRH649XtfBYfacTS0iLb2LwQUi3a4CHuYJrnrGHuc62viikt7mPIQ7UCQFfhqwGDJO2z1khDQo9Wbbm4DGss0PHOhHRRiPP9mtSYYOt6UH17aXnHFHNDiIRNuzB0D0y/h20AHR2BNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282099; c=relaxed/simple;
	bh=g2wjkJEgz/g6SIf9QvA0N+NvyCCKOaLitV1QGuL+oFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwB4gDdfVu0GB0VqEPWljkfXhG3Qz5UzE+9pFgIMjVNyUf2LWg9A1xV+JmB9R4p8Va1fI7zL6YEp9xweCIuS1NyUDpIKfIbr7TKuoqOH/2gbcBoyl/2Ys9XXfFgaseAB4mnAFF5a1ftZvENm6DOyDrS8wjSsaI4bMMyXw+PqwOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xlkf4FSS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+JXlYB6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157mopv2945648
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9y7PgfB5wRtkXBOHECwNJw+blEG+UxMtm5/nesRQyI=; b=Xlkf4FSSTzuWK9RQ
	WIMgbldN0CL7x7o8yUyXRBL2hYLbyT+nzZeD54taTRkwc/ZzwjToSavfP39pubQ6
	xNa9eLX/o9wbAVtGINDFxDVk+EeacednCUhtqY/Wx4zCOoAtsN8d4/CdiXBTIn+I
	RV3BIkVbWNEZcbRVQRgf61LxIdFqQPBqq5QCS5fgW+niFZ2cUrBsJRCzTVxXs7Fc
	IvuA5Ktn450ZheZioPfHrE0lnCnZyijfJ8eGRzRQz56LOBO1W0koZacmvebajtbz
	lcCwt62BbwNVGEsiMvUiX4/pJ5S1jf8qjVsO8KntnCerlbO2eQCAqPvR6UB1E75V
	W3KUVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4q55r78g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:01:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7701b6353so7499395ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282098; x=1770886898; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t9y7PgfB5wRtkXBOHECwNJw+blEG+UxMtm5/nesRQyI=;
        b=c+JXlYB6NXevdJSVQ4t/BQM6wZxzy+LMnu7fl9pX8ELl6ekx6w0W7rbxIHuxunR90D
         1/e1VYaKsqiJHPrKINqh54QO/kvU2NILJ/8T8KuRf7mE62+VrNYjPGxh3qgklbbn2p9M
         ZsL1fkMZWkG7si42PePVgAzUJiN2kqlXDLhe/+0T16EvvqctaQJOvuWtPCC4+UFkCvGl
         sfT1N+S90Yn/daV96aTH5arl3nHGq20pWnWDc2X9DiGehQcaixTpW0ZDzRR/4mm7CDtg
         dSQ5pPpXtvgDTxIa33hqfbyIl3C9EZ2LuT7C+/zhj6ZtwjBVpxFgTYwsjHn2446xqGV8
         vSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282098; x=1770886898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9y7PgfB5wRtkXBOHECwNJw+blEG+UxMtm5/nesRQyI=;
        b=o/bAZ1rfZ6X2ga0/vRqtFYC2mRfpckeNsb02GQl+0mEMu3rvBBc6mqv+5ms8co7dVb
         pksUCViCuF8JDxiR+wMg2D/3v7+leXDJ1GA0lWOGLaOO64lp5dSL2jb4BH7hGir76tbl
         SZM8ZRRlC3j94dKSo7qFnT/AvBi/rMlsxMiqvoAHfvI65j0HUtwAopFAzjzdG8eJAO5+
         XzcWpVOfDvn9y3npqqACZmLn2kJva8CzzjDi5rE2Li6wJpNyI4g8x4qBp+4359Wc207E
         TuoEDAoWibHhRvBplVe6wnmIXbWWkB5NYAH2VaqJ2qOij8ZEXua4E1ZnyDmpqybsDLQz
         zInw==
X-Forwarded-Encrypted: i=1; AJvYcCU/j3bJ0QSW9m0rp2lgv7ZAHB7vJhw7g4kU1xoHTmKnnwVOcssg5+m6DBTngFm8uSjW5uJdbFoSeB4i5vJh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2LXI8gvGd64ZzNdFAJv8Bm1336Ge/eWmFKGFv3wkhyXg3kZ03
	JMGoE1kvqCwA2zatRLwSjc9Wfbfz7UKz24jen194NB2LcBxmzV0MEKDMTU17IAA9/a/horWRI8W
	Om5zk2OLUIwl0Ndm0aN+ehlAd9QMUSNFR9HL2+k01OAbjteqYFGxdFYB9zjNs2IT2JTgd
X-Gm-Gg: AZuq6aLgXAuCAAkgMpsbaywxCJHiq6OEaseswZW/1b8Yc31FrHtihqLhdodU+x8iPRM
	6V7M+GBpA0lI/4W4ai87OmMZSroq/vjA+XuB+qEEYGqbipTz9kuTVgVC75BIi+3dtVh4jTeSFjV
	5BpjP1droC8vgZcIwZYJwM1hGrcANMBJClYDqw2/TqbYcjeNG7Q5JKlufQ6fRtUeQg7TS6/vhmB
	bYiE0D9XrS7v42EqOxF0Be9RBks7qeoky4EY/M+SBYgjmHbWoLb7mLKLHE7rM8C/P7m0Ufd6oan
	1bUXi2hfSsuKh5WyrsSJYC5GeIhxBWoFjEy1w8La1Ant2usWq+W9zbb4LiXo6W5Vi1nHZdcmoJL
	vZFUVXgpgEUvTgQDLAbGhl1DQ16bh+qI7Rg==
X-Received: by 2002:a17:903:191:b0:2a7:8bf3:5677 with SMTP id d9443c01a7336-2a9341371b8mr58416555ad.59.1770282097708;
        Thu, 05 Feb 2026 01:01:37 -0800 (PST)
X-Received: by 2002:a17:903:191:b0:2a7:8bf3:5677 with SMTP id d9443c01a7336-2a9341371b8mr58416075ad.59.1770282097101;
        Thu, 05 Feb 2026 01:01:37 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:f71:e44b:ad09:c977])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93397c472sm45412385ad.89.2026.02.05.01.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:01:36 -0800 (PST)
Date: Thu, 5 Feb 2026 14:31:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robh@kernel.org, saravanak@kernel.org, andersson@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH] of: property: Create devlink between PCI Host bridge and
 Root Port suppliers
Message-ID: <lnzmgsdjckbf6u5hxfqm4kzlmcg2cqvszcg7otmkqxaj3yzdfq@vu232xx5kts3>
References: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
 <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX3/GiU6JynL1/
 hDx99HblKJopqLF0Vr2gEXQkdMwpjMUYahP5F63lCjD50rF8AkW12mCXDNsV0IB0FV9LfVYDiVY
 rA01EN8xQbPBpZ6neDGNc3e/yOMD1LJ0e02aHkgBJ54EuoL3VRHf5fwr7fUDtssvMtkgQCbjorX
 MndfAQ4lf/Jhl+jq0tUUqMQIOulYym8DgBe4WeTyNeWj333+EmZXiL4F62v7sIK8VCvciBkicIo
 RYSxRl6MMPyUx2k6soSslz5cfHZh0mIf8bQnvsRx3ht96YJNVSjzRYq5DU7IofnxJU1V2Jjc3el
 isKQcoY++LQKvIqeBchHeJYGPMkzMU7DwidXC2pGOGZ1FAa1aFnpKh2lCNx6+MJ/UC+vPQuU9QV
 tSzJrnlzaOsvHyZC/MtWKv6+wfAwPQWfQtM5yfAgB1k+iv1vV+J9aNbor6R+O5uUYbecWqu1sXl
 9ulXW58N2FW4O/EQR4A==
X-Proofpoint-ORIG-GUID: cKJVgtTOfIYpK2MMQwdEekxnzG0MbTEI
X-Proofpoint-GUID: cKJVgtTOfIYpK2MMQwdEekxnzG0MbTEI
X-Authority-Analysis: v=2.4 cv=Z6zh3XRA c=1 sm=1 tr=0 ts=69845c72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QMLHC9eROS6L5-qU9K8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91877-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE9E2F088D
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 09:50:20AM +0100, Konrad Dybcio wrote:
> On 2/5/26 8:06 AM, Manivannan Sadhasivam wrote:
> > In the recent times, devicetree started to represent the PCI Host bridge
> > supplies like PHY in the Root Port nodes as seen in commit 38fcbfbd4207
> > ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
> > the Host bridge drivers still need to control these supplies as a part of
> > their controller initialization/deinitialization sequence.
> > 
> > So the Host bridge drivers end up parsing the Root Port supplies in their
> > probe() and controlled them. A downside to this approach is that the
> > devlink dependency between the suppliers and Host bridge is completely
> > broken. Due to this, the driver core probes the Host bridge drivers even if
> > the suppliers are not ready, causing probe deferrals and setup teardowns in
> > probe().
> > 
> > These probe deferrals sometime happen over 1000 times (as reported in Qcom
> > Glymur platform) leading to a waste of CPU resources and increase in boot
> > time. So to fix these unnecessary deferrals, create devlink between the
> > Host bridge and Root Port suppliers in of_fwnode_add_links(). This will
> > allow the driver core to probe the Host bridge drivers only when all Root
> > Port suppliers are available.
> > 
> > Reported-by: Bjorn Andersson <andersson@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> This is not 'required' in bindings and device_type="pci" doesn't uniquely
> identify root complexes (as can be seen below).. but I suppose this is the
> best delimiter we've got
> 

Yeah. There is no way to uniquely identify the Host bridges in DT. So I had to
settle for this.

Maybe I can check for 'device_type', but that will create devlink between switch
port supplies and Root Ports.

> Perhaps it could be made 'required'?
> 

Nah. Linux will generate domain numbers on its own. Also, this is a Linux
specific property, so we cannot make it mandatory in dtschema.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

