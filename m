Return-Path: <linux-arm-msm+bounces-110129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIFDHCNIGGr2iQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC85F302F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 593BF3011795
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF8E280338;
	Thu, 28 May 2026 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgX2AMwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdvJp/K5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9207276028
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976218; cv=none; b=ppMaYJFh5/8oHXCg9p1P+PU0Ff5yCdqK0nlCN7Z4dk6ygEen/8Zrz1167lgahNBqq7z4hIoTyy27Mk6RU9sKOSFtq/y/HC6ForPrjw2skmRHJE/6BWT2eiDGswNjQwSI46gWiJxwVpJr9cpkiAGhNKT3K+P9b/5AJhtajHEGPRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976218; c=relaxed/simple;
	bh=vd/rQRJQWLIg+xDuYcY88Qbbo0c1bTx1+oaoNovwGyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAPr7Izw93gmxYBOt+LuKwWBmNJdPOH+m4obPbz46lA13aGvXYdaCMgXjT6gLIJ7M1rnnw6SO7TDgsIfUsTGPGevZ0pQUDtuQ1xK0ChGv6EAtDIU3gYH8xxEQ0IagXnIWSLwUcrUY3BDzfaVfO5DvR3Q3qdcjlcHK40tA28pdv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgX2AMwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdvJp/K5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vSdq4184457
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V1s8jKskQG0bDSH4tCE3i2dJ
	j/wDsiGH0s/CmPfjVgE=; b=NgX2AMwDdKD5hgnZ/aYfhZ8QKTSbIG1dhVGw28oC
	JE9VZ9pHC7Q9lp0qBxKGwnbXDagxOHrxzUaHpAS7hXdptOXPGCF4f8m6NQPyW6Z2
	KMjfUFxVH1jCEkCXkKVUaj4KEssFUt1vVfIiUJl2DNaN8YEQT7sFqEuD088Kv8Ft
	uJDIsZXU/ho+KkQKf2lx8e3lO5DUexyPcYZWGsH72h/Aa2tACM2fu8thXVZQYecv
	WE1IY48F8aA9vkYcxFlfa3PFRdXFvyjyO8YLJMueXqkInfP/Xbd6Hgptmp00SJUY
	zda8ERh+f/Z5TjiAA+dduUqaTkg5oqXjdYALwFWwdC1s+Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yf2yn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:50:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63144b84f14so16144437137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779976215; x=1780581015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1s8jKskQG0bDSH4tCE3i2dJj/wDsiGH0s/CmPfjVgE=;
        b=fdvJp/K5Q9X3GiJZCj+oDun76mibiFVvphFV8V7wH/f8dvY4BlIxrzIwgRC31A/Omu
         nhVRXT6LZMoz24Bqt3kzkOoUOdIH2oy44dw3bYxFmvOOmPRJM2LiR1gZPw9oezawVzA/
         g1B0Ovo+yyhP0hMTpa+TCHoUR6+Co18tlwHmtncIFgLtLq0SOOsp0lb20fYMD9PiqW4/
         +iJz7dAUEJ7tbusRiRZaLm1p6cWl715j+c/Gu1gubVLhwih2fVKH8QVkK0HZbANvsOH3
         mfoYH608D8boPTdhksT1p941dyivWSHI+StYMHqTxZm8f0wMdfYYjGQgeMnXnN9YUA5I
         w+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976215; x=1780581015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1s8jKskQG0bDSH4tCE3i2dJj/wDsiGH0s/CmPfjVgE=;
        b=Gcm1gMMbJDvKzHimM7xL1ExQI6wq21SY/wVm5cCLU0DsGJef00GfIaH98YPe1sSuGk
         GwIEIHIR34Y68QioCLY4Aqllz8KfiOHd14qGFE31KYCFPT82Yah+IzDM32DJ+/SgMzlp
         Dji4sLH9xrm99huvkgXBRrihmJ5K78RrMzM9Yqz+0hm9UU38IxMcFr/Ek4TbBh8y0zdg
         QdOqh2p8x/woXZDhoe5WIY18Oy8y49Zzm3PguCOLPBeeyaOB5Jz5x5cmwycCNGtbYYtC
         BiOJNflLCqOCPE62t+muCbZO78y9YG9JTcjcFslyQ3VtwSQM1bRJSX9dpFgOOlbUGB+g
         DWnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Gv+K6hrmmAYy1u3upHGxJ+b1BgG0yHkQju6cWyI/oEWk6mv8C9CETt67D3TyMTQMHnZUavJH3MbUGhqHy@vger.kernel.org
X-Gm-Message-State: AOJu0YxkjXO4dSqeOGAKJYr0V63q2otMZElzc3SZXkQ63hwYx8nEZh8y
	LPbSrZCsU4iCx2bArNy5Un9qfyr/s7IgWm912l5gUlE5QLXRLcIwzHQAipV02Al4xxDYfMY3ciX
	vHLtoIvjy+CH71anOX05LrsBClkyxTS6YzFYOrdNZgauyPP3oAVHUpjkF1owiI6ogaVN4
X-Gm-Gg: Acq92OG/yLfLEj27kTrRuKvJSJweOmFfXHSmW7+0ZidskdXk/O8rRwDi9SPePyIsRyp
	hgr6tVYdt/1jh8P9jgkrOfHp22rRCX8eL6zVWk/8lPRD4AXxma4AwxrbK+ObKFPfpG6mlo8UzvD
	7JO//N67L4+VFLozhYxClyHfL9n7IOHcKFnHn5YKFlizBmOwTZVQRLmY/v7suDkGPysYsu6iu7g
	sHpdbJEkCH0aN80ZiYtOYzoB88DtDdqo5G4LbMk9HbyzaVdB8y8ku6NWc+25t8COgG/xdjBt4/h
	HcffqdATmTRd8Ce+16TllUD4MQCnrZ/IuJpMv6+/M6E1Wv3XR98G2ykOi9Xp3s+z3KReie5t2N/
	srtIHDZT1HgdS61uuP651IIKB+yN8hZQ+qcjRhaKolAr6QSGHZF6VGw833bz6jOVMkJrlLpXVLC
	0GFR57j/r6PPXarKKy6XUVm0Lk/yK+0pJvYbRBJS+9kZgJzA==
X-Received: by 2002:a05:6102:5ccb:b0:632:73ad:6c8 with SMTP id ada2fe7eead31-67c7f273532mr15881162137.7.1779976214956;
        Thu, 28 May 2026 06:50:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:632:73ad:6c8 with SMTP id ada2fe7eead31-67c7f273532mr15881139137.7.1779976214562;
        Thu, 28 May 2026 06:50:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc45b19sm39183511fa.40.2026.05.28.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:50:12 -0700 (PDT)
Date: Thu, 28 May 2026 16:50:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
Message-ID: <lj7geczhthury476ilkjym2k5fblo5pqroefsbdfgh5jcf7zy2@qrss5xc7umn3>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260514194735.GA1939213@google.com>
 <d4d35e17-84fa-4c95-9bfb-abfd25ea7f4a@oss.qualcomm.com>
 <20260522024912.GC5937@quark>
 <c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com>
 <20260525142843.GA2018@quark>
 <e49c4a45-6455-47f3-a91f-c32c1a0b99be@oss.qualcomm.com>
 <CAMRc=MfC6CEwOXYttsav3mwqyJ2F4sburBj+zNJ25qMoweyL-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfC6CEwOXYttsav3mwqyJ2F4sburBj+zNJ25qMoweyL-Q@mail.gmail.com>
X-Proofpoint-GUID: 2TBrGXk07prJmThka8PQaaw1rsqVNfGg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX6AP7cwIqpmuc
 n98J7eldKfTJthCDB/7g3D6sVtHrsntp+Fy3lfK+YY+pk9ih35kzbDrtHCjOi0dvDJT+eC1kX0J
 kTw6Xy0ESxzfv+dafRIiJpLzXgRPkfuQD9S92ycWd2pzcDIAK82eY8l/kwKYOSoOzPRimp92bPH
 24taIjIc0QyNqErhh0Oy4F+HhBsRM8mLSAMcy9xuRAosEuZZ4V9C/0UU6vSsXRi7qjdBLnzG6pY
 bI6f1CAWJKs9SGRY5INpehDXhIu3pLAhTy2pCpO/P//30ublVhZKwXwW084UYZFQngp4FrY7HWz
 vAWIVvU4qgj3liktWepxpqGLgP08D7dDNlbR4zX2ifPqMjmyKNd5oYfVPpBDgbisnWWwXWWn/6d
 oq6ZM4CVdojB8PnHtS/la2Pexk9dNI8Ibec1jcdSlt3boNYDD+xpE+OPS/WeYl5Ql0e4S3bBcCj
 y8wqVQZr0TBb2km7Fnw==
X-Proofpoint-ORIG-GUID: 2TBrGXk07prJmThka8PQaaw1rsqVNfGg
X-Authority-Analysis: v=2.4 cv=G8gs1dk5 c=1 sm=1 tr=0 ts=6a184817 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7wDE0xjjevibnHHXysgA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110129-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2AC85F302F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 09:13:23AM -0400, Bartosz Golaszewski wrote:
> On Thu, 28 May 2026 13:54:51 +0200, Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> said:
> >>> +Bartosz, Gaurav, Neeraj
> 
> I know about the self-tests etc., I will address them next.

My 2c, the self-tests would be more important, as they are fixes. Doing
the crypto in a wrong way is a bad idea...

-- 
With best wishes
Dmitry

