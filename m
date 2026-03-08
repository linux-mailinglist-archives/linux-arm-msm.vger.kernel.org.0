Return-Path: <linux-arm-msm+bounces-96060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F7dHeaQrWkQ4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:08:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A68230D68
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6921A3015447
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 15:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4E5286D57;
	Sun,  8 Mar 2026 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmMiHMVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrtNSbTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DAB2580F3
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982491; cv=none; b=alqV3Y9sVfdLOgrE5P7vlXaAbS1/NpaQdUd+r7kT793i8ou60p3/zkIurw2+YR3lmFhlZexykQtjy89FeFge16MDSMaqGQ8RMzZBsJs/HRZ5LCGZOqXRO8v5OWlrCmS6ouXUCehBToXnwmGAJxVSUAypWlJyEN3BEVc0piue2Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982491; c=relaxed/simple;
	bh=KWgTeiznsOPw5APcw52eXBaL1ZGPPaRvhNjWLUEyR1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9jY9Ke9xRAyscROZVixE0D/jXIKDCuJ2aFrHqtJNnUDGgIW3yOSWjHNqClOJyqzH7nkwPGipXgyNpemTlVINm7RC22XeblZrzhC+Ss4FQ6AMTba+3JnSeoiXvMlMFNvMZgUto9XzP1zCySCs+RYTgozElqJ69+cuArdB/Sp5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmMiHMVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrtNSbTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6283tGLG1425422
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 15:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rvi08IAd9UMRUOwod1y7p+91
	CSiqtivUDxTDdSrOr7g=; b=GmMiHMVbeCQiWsPlbn6WHGb0GF8NtmZoWnoeWP9p
	L8pa7UmWQU6B4HTpfg2OrDHFH1fjEVG7/TZlf3n21XPkbk4LOWl/xWUXex6WlsA9
	3Ce9CpL/Avr+F+4F0mDy7VJbICyTexbr4FgCd/+f1fjTuPzFbYfjsMziVYhQ/PlU
	F3mV3StM7HhdnSQAzYGpUG7oiJgtKaGJlXvJAOkHCsr9X9s3n9+d8dAu77oSZuqd
	KYzhCitu+22V1AfCKPl/dF6UbifxbJ6BLk/eO5jf93KBqEMuKP5K1uL0n6Q8NgGv
	PUaBze0S7z1D0i0Bwo/0nUV/5nCVM+NGtcuY02dJTiNRWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrju9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 15:08:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso887096785a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772982487; x=1773587287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rvi08IAd9UMRUOwod1y7p+91CSiqtivUDxTDdSrOr7g=;
        b=LrtNSbTpTAB7RUFBxZqbwiDP0wbaIjwi6xk+ROzJ8ypgH4/UANemu0YQxCKqeEO6zP
         laBoGfPmZAjipwzAHAa2kexoqCf66dh9IYr5q1mxO/SFB4DKMhIM571hn4ZcAijxiZlT
         ayRLFsAEEyKDL5NdmVd45gBg4urZ+RPFOStoFQ/3RP+vKdD3QU6pSd6G0c2Ir7AOZTjg
         vb3Jsq/djnzrsR5bW6kDPuKmGR7MNPhqwQPw1VKDY0K4DaewoKxipVt1DPKBqDfP2lhp
         mEKAl65dyziYms5QsBcdPR36qX3UJXVluqTnP4pi1Iz/WxS0rxrqNlmHHBEuhYruEa+r
         f+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772982487; x=1773587287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rvi08IAd9UMRUOwod1y7p+91CSiqtivUDxTDdSrOr7g=;
        b=ksOXjPnFsr92tgFSUJh7cSCz3LYwkUyTVezEnVLsHzt54x/a2VjIN2XlDuL0cIrDBQ
         UCDzEJZjcfRCfAtxkjs9Lx3PO4hxlSNMbOgOPuCU+LqJeFQxK8fg8jQps59/vtRdimxx
         Mf3zsrTuE5nqwa/HAdMRY7u0FS5Q2xNT0znSCtneSmJiUbkT4NrFnGGojvuMaoqiTC5b
         ixczm7SjxBDLx4HSbcm0/1BXVMftEtz5VvkmI9OpE6hNlzho09j31BDoodmvYbdtd3Y3
         KWNaG3dDqNu3amcskxyq2msQbGn3ncZJ+LEx7uWRf34j9/5Q2LUN5ppPNFmCtrHphg8y
         2qYg==
X-Forwarded-Encrypted: i=1; AJvYcCXi/M79shelMJX9PHoRB+VfCAzaQ1Gy0WzUsM91FofUvv8xtSowbgpwPIS6uWpAuL/Gb1hjomTGijDO7UOw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4ZgdB5IJlZNyktXh2w17HR8oqEEHK2QtL1RzU4pGUfmPpy6y
	K1iCvvh4LNoeghCFyWOxz6scwi0FKFyL718u8i9U5ERW9YOikBAkeOBW13WsOn1fSoX7uuzy8WO
	bYuvMqd6SZRlWh8Szqb7U7lgSlvrkti2D9yMYeoNMp3eRkoJUXpNoeQbXFkxsEIz3fez+
X-Gm-Gg: ATEYQzyTMv964Xo54xtqgVaU3rm1G0xqAKMLCgC8KlIb7xBOiZTKzyCargMgP+xwj6G
	nSdJBEXHebUxJbKCyAQUZFjmXzClvbEMGMeZ3qGrTIx96i2DF29fjv8sIzULIIvlVDsuTTFOaTQ
	pEimT6tBDm4PXgds8hrXmrvvmoLUPHMTFAHKL/QHEE25NHwbCd712+cI65PxzKl3rzAsUhaysXp
	r7y77jCRzrGG0sMlpEVO/E5AmNCj08IS+xH9WnFQa0sk4nCU9LMjSF8hdE31a/QNBmw2W30vIHN
	bgDg+BWVK+W2sHuNWCYoOw9m+YRjGmqhxZK0FeCCBa3pMuZG6r/iFFuePPU0B70Q8IgApbM+QxB
	k9Z8h7mfevnHPPSVWqYNI/lmGCISNohaEBw4iG2uc7zIezm0m807sQSQvEPRo9e85xIz35xQWph
	Jr54cQz0OEJ8gwKVpfsj9nrG0U/n8nbl2mBOg=
X-Received: by 2002:a05:620a:564:b0:8cd:7f7d:b091 with SMTP id af79cd13be357-8cd7f7db19cmr295647985a.71.1772982487390;
        Sun, 08 Mar 2026 08:08:07 -0700 (PDT)
X-Received: by 2002:a05:620a:564:b0:8cd:7f7d:b091 with SMTP id af79cd13be357-8cd7f7db19cmr295645485a.71.1772982486904;
        Sun, 08 Mar 2026 08:08:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e0cfsm1483302e87.43.2026.03.08.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:08:04 -0700 (PDT)
Date: Sun, 8 Mar 2026 17:08:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
Message-ID: <gn4qdul5tdm26zfgem3y7jswucvbk4jb35pabw3uf6zl735h4w@6dkrl4najlhd>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ad90d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=TiCh2U2r927ZuiwL-uAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: nlTDimocCkL5cfN7nHw_1JjObJJn82qq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfXwrjdMsktStQv
 aN8H+vhtxg2opz65phqkjRp0ItvdG3EQ1PBGhpgGqPVQpiDZg8safMM4gMX4oruUAdZXy09D6xP
 7ZdmP8sMYcJ7N10clc3HAfCN8/WWeu9kXxZ5aeGf8psARUaj97xbDFCCrmR9720NOqptKG8X7cx
 QGisNPCPYylhNsiw/RlYPW4M2H5fgnbEV5K9XUm5u1/AHxumQ4XJzCh9XUdRD5z/wV/8f2KONop
 HzqnIhkY7GsDki3MTbSio02GwN57UuviQYENu8UibG9Q/JR7Rc1q0BKmyUaHLYOfQtbLK0GYSJF
 aYbyAwzcvEMB6FZBIy6HQWZRN+WnHsxdSkItOyHSgxBRw1+MJGfiUWFaCthQf8ZEHQpWB2yg26t
 lS4UM7OnJEOrKEC7x6RwLJAn2dOpo7LaPevXs6zgp25RKfPKi7kK0YxyLwOBOOSGcMCcRs2ZDjT
 0o7amIUbDJEav2pWGEw==
X-Proofpoint-GUID: nlTDimocCkL5cfN7nHw_1JjObJJn82qq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139
X-Rspamd-Queue-Id: C3A68230D68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96060-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:52:44PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Configure and enable the WCNSS which provides WiFi and Bluetooth on this
> device using the WCN3660B chip.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

