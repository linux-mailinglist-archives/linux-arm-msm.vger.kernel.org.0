Return-Path: <linux-arm-msm+bounces-94225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF9TDrjkn2ntegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:14:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D18111A142D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 918CD306ECA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 06:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED54938B7B7;
	Thu, 26 Feb 2026 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ms86ZEQt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNjszvZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A263F38B7A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772086453; cv=none; b=Xedf3Q+ANqkuQUvScpPXi4ldLEfTV310+ETMussL9l/tfT/fD/VN3FFQCetPGek1Z5/0FoCRRXEGjS+sLl5QAcm0wS2Mnu5uZ+sS1805D+pyATL6axK0emqmQrNlwbmo72V2igqpSDV9usbjsaoct21fFY8Lxu8uS+sKngvEnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772086453; c=relaxed/simple;
	bh=m+AQKCxO/LycJ/O9uPJYO7qZo0j4nsAa3IseTsVVrv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoMhMs9o3cHsWYwffqXSRH8G2Z5m96bvyGDAumnH7HQzRmXeQ1KYcFEsuLjWWRYEE6WqdPmEFAi6j57eF/iDiFdFoaW+A/9o7bsnd/7aeF6bwco454gcfCO43khSOx9A6gwAi4mEHYJVLSDNgLyYM9IoIGvUkHu/QvOYCwyMcOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ms86ZEQt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNjszvZ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VMnT3721949
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bhxKk2mKAOrKAUcO1cv8XTYS
	PnL0KRsykixJVQdAXmk=; b=ms86ZEQtx5mYD+GDtgkhR+/7q8PT+AwHsekfG00Y
	Gni4JgNzCXKdB+MkiLr4s1ymi5A6T1q7JrL0SNwCsYfpyjx640ZPE//Fmoz7RfH8
	IpBLb1ur0rZNymlpu43EjTzqp9ra8ov4ZsuPUmYAtWgwApzMkLyPL9Q7riBXQsJ4
	J3/Xiu5O6PkbSIy3HGWwyDirIUlsYU0Zo9JPnnNRRQeCCkWCDdYvkctxADQfXlEc
	Ct36PxQoWeiY+pr3p/A6OaqGhQgRdTLtqOu9JhtheEaO8tNcwRkRzxS/KhgfZTy7
	wEmi6Uzv2ktjfkEeSz9V6UcyNXONJEHBL9pYg5sT9dMMGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf346y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:14:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a90510a6d1so4186965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 22:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772086450; x=1772691250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhxKk2mKAOrKAUcO1cv8XTYSPnL0KRsykixJVQdAXmk=;
        b=YNjszvZ+/QjbY8k2K7QQWgnUAwizypUnf+vz4QdjHSjGDqX5YedDcenjR3G/tAXF0y
         9jBftewn3/VRWw1GTUYN8QUoQQyZ7kw6J5vLAlaUlE2ctdYPSDsG50a6FbBIbTbhOlXx
         1xbiZNScr+haTy5k71mxq3R1m6fdYMRRJ/xG37Zj1t69S+Dz2a7UaZVpy2WtLyNN4Scy
         7CKJhx8O4dCKakRZ126VEYFMIkJTrzoO5vqTQYtFuYecpdcQOeXP6ETjVeF7ffmHeUqh
         7fT/+pA4/CfIM7OK3ylJZ5Q5185rkA5uvwV3ZCLrY7fUzI9KTL5cBiuGjtbVG39S0+7L
         tX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086450; x=1772691250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhxKk2mKAOrKAUcO1cv8XTYSPnL0KRsykixJVQdAXmk=;
        b=Z8F+mvj1GiRovyWpc8HluksLD82OYmFOfsqCSzmwPnkEnEk8PNAHwa1hAvs4MCEEVv
         jdCgaZ7Ul/e+i45KpS5aD+YWctn5xeyLi2fFmnYSztMi505nF88XZFx0bH/zwmD6ibXd
         gzaDOy6J7boTb1AJIglA2eeux0HBkYCIMb7BWfEvQ9QAI5kZZiDYliLb6cwMxLDSWva7
         qcW4rFhAQI/RQXf8y4WTgzmvz1zmx0LQl2J1yxuGLnSfnLHuO8niTJSvI1nV7H28aggK
         f4btjcd6Hi5XBsK00+/6c3wXKfOhfS4x3W+IXklRT2Ta7S/zZ2t9DeIP8TXrkFrDaVyU
         8XOA==
X-Forwarded-Encrypted: i=1; AJvYcCUTNnWZvLJPlzj7tYMgXjq5/71Ja3nteUuS6MmG8iuutW6b6RgmBMrHywH3Yx+yQ3lFIwpKtLaPsrwdb5af@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1B5WSDcbSAz8WxePyMu+8Bh3pfsAcwCRo9e8DQEmCBR1qaTo
	mBg7i6/gYa2Gz1Q4wACMZVC/4l5Pk9K23Z8Vg4+Q06o4GZAZmK8CJj5gLPgj7Y8x8H+1RFP6TFu
	yUhnuhN4bqLHhaY9BgDxpWQqawt80OxXRTXtSTfwh2GScRS/U9GKYAipA1BMhWbSiRCWO
X-Gm-Gg: ATEYQzzmRoItT2s3ipAFrTrL1xdbEGjyFXQ5KOunh5w/KaWzCBTjXcYiBGySQbMiS0x
	QXFrJnY1921m9SGtWfqmw58/S3WqPpfc5/98BB9w5N0/rME6Vizovj2IFfn3Ao6ru8utqv6oNiZ
	Hj9toXh5lxGCqgihpdKvu5EliSfwF9J7NalIR1Ws2C7Le23s3ua4oacJFu75FhG1Ex5xCYjeP7G
	eyfKhGch3kjnrX7pvYpM2te6EIWpd5toxZYI1VB9iHp+4qessmWdX2OJPFbKAho0BcMVDOJRQ8F
	1BT383svTtNfhBxhMqC8q0QxVhr51mY+rLA8CoAMC+kItYpuQDxl46F7V8gbiHJiNKiNa7kcULs
	L0LzmMnqFpEXdtqHiKtsOZbXWvs8F3IMYf0EugE4fBIWCBDXxbHVn/yPggAA=
X-Received: by 2002:a17:903:a8f:b0:2aa:e3d1:1430 with SMTP id d9443c01a7336-2adf7943a52mr17975745ad.23.1772086450449;
        Wed, 25 Feb 2026 22:14:10 -0800 (PST)
X-Received: by 2002:a17:903:a8f:b0:2aa:e3d1:1430 with SMTP id d9443c01a7336-2adf7943a52mr17975445ad.23.1772086449916;
        Wed, 25 Feb 2026 22:14:09 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm11406555ad.46.2026.02.25.22.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:14:09 -0800 (PST)
Date: Thu, 26 Feb 2026 11:44:02 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v6 3/4] ufs: host: Add ICE clock scaling during UFS clock
 changes
Message-ID: <aZ/kqmGF5EJDE76W@hu-arakshit-hyd.qualcomm.com>
References: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
 <20260219-enable-ufs-ice-clock-scaling-v6-3-0c5245117d45@oss.qualcomm.com>
 <f984c9a0-9ce2-49f9-927b-e69c26f69176@kernel.org>
 <aZ7x7gG0OZEQSKVy@hu-arakshit-hyd.qualcomm.com>
 <784d5711-3f3a-48af-ab1b-9a8834249445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <784d5711-3f3a-48af-ab1b-9a8834249445@kernel.org>
X-Proofpoint-ORIG-GUID: jMOvU2vAyJX65l9r7ssXKzQSZGjEmyEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1MyBTYWx0ZWRfX18q0gdnJSKqO
 8Yi1EcdW/1JSrCGbEFMjQSH95md1ML8AjDPM9rreus8GvLewDU0F3IoiDrI0ihGr9mJzqvXpuL9
 6UW9A3wdYHt7MLS1nowjRhwcTT33KrEu3wa8eQJfAGxtu/zlWVOKk9iR16ESUaHrPndGKXYPnff
 6Ej1z0Mcli99nh2spRrbJVZZ3pH+vCBYNncIAjALLCth3JQgqDeqxPcI/zVFh/r2t/mhOPCkTkY
 aDkIf8VUe7uNGZjoQ1vncjlyrI8db1mwSqg8PGBm91RGMZoBM2KY2OK+J5zKRpZ3m5vT6mbrktf
 qTNFxF2+eaXIBXI5a8rorKD1ygycSHD/6C2XyIK9ojS8vUya7LLTcsswlrlHf36NWiqaOcucD7O
 EX5ny+juq4PpI1v/bs2s/UF7Haau3iJVmbueN+kTf2Airbn5VpAIdDz8bG5jGiVO+QLsaW/p/UU
 0Hdzw98LmhClxkZEeRA==
X-Proofpoint-GUID: jMOvU2vAyJX65l9r7ssXKzQSZGjEmyEe
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699fe4b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vLMaN86HkaFgGR5djpcA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94225-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D18111A142D
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 03:12:18PM +0100, Krzysztof Kozlowski wrote:
> On 25/02/2026 13:58, Abhinaba Rakshit wrote:
> > On Wed, Feb 25, 2026 at 10:00:12AM +0100, Krzysztof Kozlowski wrote:
> >> On 19/02/2026 10:39, Abhinaba Rakshit wrote:
> >>> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> >>> UFS controller clock scaling. This ensures that the ICE operates at
> >>> an appropriate frequency when the UFS clocks are scaled up or down,
> >>> improving performance and maintaining stability for crypto operations.
> >>>
> >>> Incase of OPP scaling is not supported by ICE, ensure to not prevent
> >>> devfreq for UFS, as ICE OPP-table is optional.
> >>>
> >>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> >>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> >>> ---
> >>>  drivers/ufs/host/ufs-qcom.c | 21 ++++++++++++++++++++-
> >>
> >>
> >> SCSI/UFS is not respecting subsystem boundaries, thus you must not
> >> combine multiple subsystem when targeting UFS.
> >>
> >> Please split your patches.
> > 
> > Sorry, if I fail to understand the context here.
> > This patch-series is already split into 4 patches based on the subsystem.
> 
> s/patches/patchset/
> Please split the patchset to not combine independent patches targeting
> different subsystem into one patchset.

In this series, the UFS subsystem patch depends on the new ICE clock-scaling
API introduced in the crypto/ICE patch. Without that ICE change, the UFS
driver cannot call the scaling helper, so the UFS subsystem patch cannot
be applied *independently*.

Given this dependency, splitting the series into separate, standalone
patchsets would break bisectability and lead to build/runtime failures
if they are not merged together.

Please let me know what is the preferred approach in such instance.

Abhinaba Rakshit

