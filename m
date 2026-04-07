Return-Path: <linux-arm-msm+bounces-102169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LF8MwMH1WnMzgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:30:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD413AF25C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 108BE3033F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE9D3B8944;
	Tue,  7 Apr 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtGfXzhP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jerb/1vx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C823B8BD1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568504; cv=pass; b=fFmWSAXCv89VkoS0Y+50brTOpuFn3Rd4Bmjd1L20tJLntY/NEWN4folfg5scu8PUwtwqEUco4QYXnpA6UNMtAlJcoYZDk51NtEbCOqOwzRG9tClLakddZ+uX8pup9vZVvgpsxX01Tbf8EAzLH4W+2zPzhwe22XWV8amYDTjNJxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568504; c=relaxed/simple;
	bh=3pOru3AI31M/7h4/J1wCs9vsJpaSVKgPBYqi+q3nlak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSqjNTk0XwM+eC54TWPf18HfENr5SUJWnFRxTsniEKsuLEfaYgw737QmonKgQ6iISoxZ+qZ3uUtpYWOLuelSiw/gIOtGOohpIPj/YKdpX1GtcP3U/+6T991N+Ynjv0L2O1xGDzI0WghqgqImDldqgKev2J2RV3jbpY5gp1KqHOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtGfXzhP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jerb/1vx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DKN8N3815757
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3u3llKzVLDQQ1FlFCEY194yhid55v7vOzxTYrGz6xOU=; b=BtGfXzhPfChAEVCy
	xpiyQDSs/fGZP8cjWz89crppBhT+9xZ5t/LTYmC4ddtYs8xEoJGeh8/UKJmzuJ2j
	jX73Vt8nJ5JEdtWPL0QPiG7ueMw3k7jQetD5WGU1ggIylvdhwxG7f1K+NtY7RtGP
	3itgxU9fZtBkPGBxlZ922aazNS34tjBa8vdvGu+8t07tlTlwxzGioNubVYpYpQP9
	WYZFmordBwNB99tV5yjOa+2IotiWLqi4J1g60UC1YpnC02+QAmUbNhdZtznk4yF8
	omBceh2k+cv673/oRvFZ3BcI8A1uJqx/Cz0SIBFu129cDFTFybBwociSLuLVxd9R
	WDKa2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4twny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:28:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so123111461cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775568502; cv=none;
        d=google.com; s=arc-20240605;
        b=T0JwlWU+Aa7nV0VLyTi1JJX0qM0itF2kw6xgtbyp5/7SSIEc8Zml/ZbTtI4+C8yXBE
         TJqbeScUIRAUP2XxQrBk2agUhuFRJfqHqrA9c6vZp9OfWtyIWK4zpSBMiXwoFfMSRNfV
         2s3L15ERmWHQ3GJ6mwp/poDJqj0CuTby+NgRxn3O+O0pIxnXsdiEbkWnjVP3wMkuWYl0
         9yp8tYpNb/XvClQGZyF0cny+Cbma4mbkoIzmiqXz9Gf1HBLbBU5ZkuvSD7fLGhaYXnTR
         UNXnk0Q1NB+ZqXNFVjTl+jNTZ4JhTFBuIaFTaygYIyyYhkwlhCyUD5Dn3WgJ/yR2bjpV
         Udxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3u3llKzVLDQQ1FlFCEY194yhid55v7vOzxTYrGz6xOU=;
        fh=+iclYT5SkWpGB2JXl0tLo0nr7aIBLUc9WMzecosryjM=;
        b=SEE8ruxdbF+9ENvII6TJU72UzHkZBqez60UuYQVH1HUlB64Pqoi1WuLipmdRz0Qqc0
         G2w/A6WR359qIOIztxz9yFU/xObXmCu96QbtdXPJCjKCyu934jBlJggvLfmzsf4JS7Vv
         L+ViWQSKGJMCVGN9zK3lVRMUdPYECq2gBaHJBYEy6Vx5kmRrJsB0GnL3SCOLlMrCIuVT
         Gd4ZH/xKvs4gvmguMzYGQSh8cWHiwbl53gE2saiEe8BIF3Y0fIzBxhQGGGD26B5kq9yC
         87p6JyRtUshSFrGfgLi+C0t2Y9ZZ8QLtxXiRvUm/TIwY+PwfsWMVTSXpHfh8H/W4XQMN
         FiLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568502; x=1776173302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u3llKzVLDQQ1FlFCEY194yhid55v7vOzxTYrGz6xOU=;
        b=Jerb/1vxVj9QG4HFakiUyKSqV3ryifUYxTvmog5+bJV+Xq1YBJqZ+bqRr3ZH1xuLhU
         5bDPkJm3d+yK/bzzEbqNvXigo9ZRuhCiKp4OtZ7Qme97CnkGC2deS73o/yeRxf4aIK1f
         zLO+dyC7jMmtOV6FTkvLryq7jwIdRIqnj8MRLWh1LJxay3e28MgP2Var/ouwEFvi/lbI
         DG4pjcay02TaawsEtptsR+iIbXrIgxINjgYUHtZ8STYBsJdpDWbjXPO3iP1mOTg96Sjj
         QCBkOq0HX2PO0k5ODmoq4d2HcBIPH4hSyNaZqbdB9Fmvr+GctqDh2g/foBtsGb7A/bEP
         J2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568502; x=1776173302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3u3llKzVLDQQ1FlFCEY194yhid55v7vOzxTYrGz6xOU=;
        b=Sx0vmbrVUnW3Ipw7JJZfwAPt1VSJCinhhov6MA274RuXSgnw5sKSgnBzKXUbwf2EFk
         3M92hszqGJpkTGRXv7u3S3Wp4EQ2BuTF635tD8zflCs3kbzmXw7qf2pY5eTtvc06+f7l
         SJfarQeQS90lw2HcNFDN4zif+p6mh1aw34xcZ/3ed7luKYbUk8yeoPEFzqTzHy9NYhss
         DkXpqxV7OhlKxLMUZJvITXr43354ib/0DN3QW9heIArdVh2R0R4KT5tRZhmEG1OFnJr2
         8Giel4G5Zf+58G2O7RgPGJSiaFoG1LevtirLZNqXBniC2PElMOpJrj2hWPXNNoN5+R2T
         eKgw==
X-Forwarded-Encrypted: i=1; AJvYcCXozZ4J9GaomfH60DwYLimU3iOb41E7r1sfgPVvtAgL9kyXZ0YnCNON+cbWsB/fZSvrv95QDmBQ1hkvD/Wo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8uE21MYbLsd4xGbITVuhwpuvXh/uH2aFu6m8ZVcBpvS9fN3AZ
	jM/27zayEwpx+DofD0/Qun9wpXr6Lf+tQTc8UquZQqm1aZEX8s2mH+YgjxvjxmGGJmx8OIYTdHZ
	TBJdyTA4jrvjRc9876XOh4Fwj4Zrlx7V4kXg4ZwBpVETkDGuaNFGQJyVKZLCcQuem5rKoSQ/vSw
	ylnZmQ2MnZ60DZ4gmXCiui+gfBpJE771p2iG+ttePUwvY=
X-Gm-Gg: AeBDieuovyXakxy2PhufPd2QOaFBt0QHzx1QTPZx/Wltryhca6IQALcxgOJ2v2LNNwW
	Atg0wjHSeM3fRPrA4Bft1314qb3XuxpJNsxtrLiHY5LuNDKTi/5+kZi0NE5AiWA4de+K7oJs8D8
	rgqTPShwn0Xj3VpFYM20Gm8zwNPxbXkI2vAcmEM7+wG+WW3HlenTH+uMwlraU2fYXCvUXxL2UTE
	PJSPn79mhWXEVAoaH6bizaFiyQIfF+fW+Y1l4E=
X-Received: by 2002:a05:6214:260a:b0:89c:e5f0:8f33 with SMTP id 6a1803df08f44-8a7022bbec0mr288401826d6.10.1775568501519;
        Tue, 07 Apr 2026 06:28:21 -0700 (PDT)
X-Received: by 2002:a05:6214:260a:b0:89c:e5f0:8f33 with SMTP id
 6a1803df08f44-8a7022bbec0mr288401066d6.10.1775568500950; Tue, 07 Apr 2026
 06:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org> <20260407-camss-rdi-fix-v3-1-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-1-08f72d1f3442@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:28:08 +0200
X-Gm-Features: AQROBzAyNBpy58RNaEmWDuRNdJwyI4yb41s1_d-Hz7TIYwxCes3dmoGPrtgvyVU
Message-ID: <CAFEp6-0PrSv3YpaMUxhMCYwLenD31jWy4xZ-p4R-sHAT9cYWmw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] media: qcom: camss: Fix RDI streaming for CSID 680
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d50676 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=x3_dpc_kMFUGcRNcKJYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yEktcXDU7B-Yxz2NgTGeApbucPGIOGOn
X-Proofpoint-ORIG-GUID: yEktcXDU7B-Yxz2NgTGeApbucPGIOGOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX7kBZKiA0sZhE
 RORzHdBQZeYa1FZ3Po+hBHTGTbXmpUo82zkfXvmbThp0KlmCClo8EnqzGyQi0re57WXzSPAlOBH
 13mzd+fFWbpYZukqKCV1mQ8fzaTRWsN7dAiBDne8Ttbt7CdEhgkGGGgGOESEcDJBGQyWAZ0i0sE
 G1esxkXG2SPo+oabQas4u8sTcVkst+V5L4JtJPyndRyMfMD1UeAxzbHq91vu8oKfNQ5Oh/UbVPc
 cWKbw76JNOQD30GkCU3AfNnmITNActHgj4PA1iPdZw5i1Jm/mn+xG+8ruCVMnjfBkALpE2LfTqB
 YZfQA/4aFWpVY3FnvzUHWc5LZhhXEGHC+4nlbh/2rEmDsdnjfQ9H7/Q8jiu9cxmgWtWmIzLVbSa
 NohnogjHmREJt4RY1Z7OO4FeTpRbEzTAJ+JICNPCN9MeBSJvbZufMgilhyhsAUPB0rD8j/X51Xv
 gSuv/w0ABNaDFgB+uZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,mail.gmail.com:server fail,qualcomm.com:server fail,sto.lore.kernel.org:server fail,linaro.org:server fail];
	TAGGED_FROM(0.00)[bounces-102169-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8BD413AF25C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM <bod@kernel.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Fix streaming to RDI1 and RDI2. csid->phy.en_vc contains a bitmask of
> enabled CSID ports not virtual channels.
>
> We cycle through the number of available CSID ports and test this value
> against the vc_en bitmask.
>
> We then use the passed value both as an index to the port configuration
> macros and as a virtual channel index.
>
> This is a very broken pattern. Reviewing the initial introduction of VC
> support it states that you can only map one CSID to one VFE. This is true
> however each CSID has multiple sources which can sink inside of the VFE -
> for example there is a "pixel" path for bayer stats which sources @
> CSID(x):3 and sinks on VFE(x):pix.
>
> That is CSID port # 3 should drive VFE port #3. With our current setup on=
ly
> a sensor which drives virtual channel number #3 could possibly enable tha=
t
> setup.
>
> This is deeply wrong the virtual channel has no relevance to hooking CSID
> to VFE, a fact that is proven after this patch is applied allowing
> RDI0,RDI1 and RDI2 to function with VC0 whereas before only RDI1 worked.
>
> Another way the current model breaks is the DT field. A sensor driving
> different data-types on the same VC would not be able to separate the VC:=
DT
> pair to separate RDI outputs, thus breaking another feature of VCs in the
> MIPI data-stream.
>
> Default the VC back to zero. A follow on series will implement subdev
> streams to actually enable VCs without breaking CSID source to VFE sink.
>
> Fixes: 253314b20408 ("media: qcom: camss: Add CSID 680 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 30 +++++++++++-----=
------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 3ad3a174bcfb8..edf01ba79907d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -219,9 +219,9 @@ static void __csid_configure_top(struct csid_device *=
csid)
>             CSID_TOP_IO_PATH_CFG0(csid->id));
>  }
>
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
>  {
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + vc];
> +       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
>         const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
>                                                                    csid->=
res->formats->nformats,
>                                                                    input_=
format->code);
> @@ -233,28 +233,28 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>                 lane_cnt =3D 4;
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
> +       writel(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(port));
>
>         /*
>          * DT_ID is a two bit bitfield that is concatenated with
>          * the four least significant bits of the five bit VC
>          * bitfield to generate an internal CID value.
>          *
> -        * CSID_RDI_CFG0(vc)
> +        * CSID_RDI_CFG0(port)
>          * DT_ID : 28:27
>          * VC    : 26:22
>          * DT    : 21:16
>          *
>          * CID   : VC 3:0 << 2 | DT_ID 1:0
>          */
> -       dt_id =3D vc & 0x03;
> +       dt_id =3D port & 0x03;
>
>         /* note: for non-RDI path, this should be format->decode_format *=
/
>         val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>         val |=3D format->data_type << RDI_CFG0_DATA_TYPE;
>         val |=3D vc << RDI_CFG0_VIRTUAL_CHANNEL;
>         val |=3D dt_id << RDI_CFG0_DT_ID;
> -       writel(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
>
>         val =3D RDI_CFG1_TIMESTAMP_STB_FRAME;
>         val |=3D RDI_CFG1_BYTE_CNTR_EN;
> @@ -265,23 +265,23 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>         val |=3D RDI_CFG1_CROP_V_EN;
>         val |=3D RDI_CFG1_PACKING_MIPI;
>
> -       writel(val, csid->base + CSID_RDI_CFG1(vc));
> +       writel(val, csid->base + CSID_RDI_CFG1(port));
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
>
>         val =3D 1;
> -       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_CTRL(vc));
> +       writel(val, csid->base + CSID_RDI_CTRL(port));
>
> -       val =3D readl(csid->base + CSID_RDI_CFG0(vc));
> +       val =3D readl(csid->base + CSID_RDI_CFG0(port));
>         if (enable)
>                 val |=3D RDI_CFG0_ENABLE;
>         else
>                 val &=3D ~RDI_CFG0_ENABLE;
> -       writel(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -290,11 +290,11 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
>
>         __csid_configure_top(csid);
>
> -       /* Loop through all enabled VCs and configure stream for each */
> +       /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
>                 if (csid->phy.en_vc & BIT(i)) {
> -                       __csid_configure_rdi_stream(csid, enable, i);
> -                       __csid_configure_rx(csid, &csid->phy, i);
> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
> +                       __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
>
> --
> 2.52.0
>

