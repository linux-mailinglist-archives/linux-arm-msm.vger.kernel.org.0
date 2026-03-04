Return-Path: <linux-arm-msm+bounces-95248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MOHB3+yp2kojQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:18:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071E1FAA53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6C573022FAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 04:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443FB37DEA4;
	Wed,  4 Mar 2026 04:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGsDR5/N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fY+yW4GZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A43182D0
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 04:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597872; cv=none; b=ezkm2fqV/S+9rKr4V3z6K9YBpey1VbqYAL9bVs9pZT7QAd0913UwUc8uJfj0gKGT+IU2RGnnnQOLDgk5XTN7vdiURJvR+5SMCpTCIlioXUMnPxJrTWBrD6oD7gpIiOoik3RiZXwGhbHF2rLKa0M7IGFBdqfqexGTSwuXvfspsnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597872; c=relaxed/simple;
	bh=TiYB/VHZv8GZr74L//EeGmMQSjtvZ6XNT4eFBz1no2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNg6UEQq9cU7Db9oeE915RBIBTRspyXwoG2fV5ZUMplA7fEfUZvh37iFYO4K5IzqFBMhkRK+Eb50vmWQmrB9Thh1RC9bwErbqznx8xGWG/gaLjhOWz1J6THKIZBgIJGuVLW1jLZMUbcZjpZXl8/YfdYBqe0O3TZzLZJ9wsDJjAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGsDR5/N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fY+yW4GZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623J6qKh1791793
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 04:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0JAcdZuEBA1HqUmgy1iLKp2
	o/XlgSm+bZ25MBE7wfE=; b=WGsDR5/N1IVduKZKJEVxH2UncUyfGUAtBJvltrxI
	X8c605Nw/Ngs0RViC/djuY2egCcm23VVKxwvUt0TPU4K5i8VaPGMxYLFDPLGZZi4
	Q6Y76gPaTpJD6i8/eHOWMhNKiFQyHUWkUPNsO3Eh+MrEJdioO20gSDbAzGZUnpT+
	rqGu3Xv177aV8wfXeN1OzpW17SEnu8R3QAjQP1FaLBBSNDB/reSZasDvdFc5Fd5I
	QScU3g/sMJ4ohUoiaHodoPceUYda04K/RYIVzJtyaNuNDPpw2oPTnfaRpFWY8MAK
	u/ZiC2OVui9y5bsYp/K4D+BNLvH72fP17C3KLgp3ELwtZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h29kqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:17:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ad1b81aso7173487985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 20:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772597869; x=1773202669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z0JAcdZuEBA1HqUmgy1iLKp2o/XlgSm+bZ25MBE7wfE=;
        b=fY+yW4GZvr5El7luY5lVFgtX64VZyLnrJycEH35XaXOTwD/SncQPnPS9LY2DI0pLqP
         zXivHmzcK1k5sw7N3WyDUTjwEHbhpa3n2LXkKFXhD8oZrtwMCFKPoe9HtiQSy3OM+JcR
         vgEsT5DjYE+wKMKJTuRu4Nb9x29q90ZGXHZOYcPI6LPVxxi1oLd6iKaCoSSJqq4NfBKc
         OCdF8F5psqgge9TnhrBZRPN/Ic3kBAfQyYS6HcgL07yA73apyBrLFj9k9ZMJKOblrbbp
         6GopjemIKGrJSn6K0ZQfEhshyJirECd9akdU2xdoC1y/+A+sm7nY4jIracrnJfeEJLFo
         f3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772597869; x=1773202669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0JAcdZuEBA1HqUmgy1iLKp2o/XlgSm+bZ25MBE7wfE=;
        b=NB/hrm27oit1+54F25nnJS0C0UIVWx2kzKwy1Xp3GkC93pqJ8sHLNJs+PYJeOhAN2t
         rVEIp+kQFKV01qAsuF8J5771Lg0NDr7zJu7fEdbpRurjGn2YS/8q5AWA+Wlb0ifPrFbR
         dY6tkVnQpPnhQIMIQ2+G+nmFVnm9ESpOXUMYfAX/qhLlU7e+MYE4K3OjdRGdXfAmS/YW
         zvKs6mBmQQh3UWyTykQIPaXPmFnC1j0iwpUKJXklU6B4hkCAWkj9WgzoxkLp3bA6BTAU
         rrHIFMRedaDYlTEtBbQh8flghPvWA6g2QbWBRC7Runlu5GGMkbqRswDukYoVtT02hNLm
         ervQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQz1+Wxq0b1Ec8+nPrG4Oottlfd9zqNx0ZM+tLbjO9ZMRNRDiWBTtMourng4XerhPSXxov6BBpIe1onTyj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2gdl9E/vzA2nRswb2vnnsyskLOqm3p6rP3XCixduPbIvfPsi4
	u82RL9bjsnTEHvS8nimeaDd8jexo/3GQmGsNiY+5Oq9i8OUw4RT3LDOvbc7mHFLRc11fezejyve
	cC6iRBBhimphMzU2DcJFALAF/+6qg4vLyOSYn93Yb1H7nlgx7zpMlm6HtI2cPnnQ/5/GY
X-Gm-Gg: ATEYQzyEUVrqcfMe7QdKEyrAdAy8yV5qUC2Qem2QWnOfJ8dITod7h4GFUpJomiK8a+A
	10d7G1DDaWqTlHIv0N6i6rLEC27zFzpHAkmpjuvGp73wAXCSL5OIk5DCTRK41j8Xk2viIwTTkay
	mUtCakZv/JkHBPIWjErlSR2Q667S6affYejOdW3dIY0oVOlQWvFhMfL33ngBecOXWN2Ja0d3Ait
	54D8DW3VIPdKjQDk37edf8h3OlW/HIOOgZgL5bFQh40QkvwjRpoGzNvP/7tN+t4EmafqgOWOqhM
	46lbQU2EeGXJUI+nuVQwuGkbv0o0E9KO/FaRTz91i0C5bqc9AmDaeJw3JRixNY5p1KlU4UKC2sm
	SSFy5O2zlTupjbbPQb/wkJsV/BgpYNUex7bWUd5tJD5tjup0TYRUMJH7sKb8NeNIKvY3F9et2Pi
	RaXwEe109khONqrVVKc2FhTXvsZr0/Xbp4jBY=
X-Received: by 2002:a05:620a:4405:b0:8cb:72b2:2a01 with SMTP id af79cd13be357-8cd5aef5e55mr95661385a.18.1772597869126;
        Tue, 03 Mar 2026 20:17:49 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:8cb:72b2:2a01 with SMTP id af79cd13be357-8cd5aef5e55mr95659785a.18.1772597868738;
        Tue, 03 Mar 2026 20:17:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12358402asm970495e87.15.2026.03.03.20.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:17:47 -0800 (PST)
Date: Wed, 4 Mar 2026 06:17:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Enable the
 secondary USB controller
Message-ID: <cnyjjvkzjt2ndav7hhfk4c5ezix6gwxoq23afx55hb6sf4vjtn@myaixeryjflf>
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
 <20260303082157.523847-4-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303082157.523847-4-swati.agarwal@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a7b26e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EQwHw-xIIpEP5aWSzWoA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: so2HN8zC-EOB0TJhggNMl93rULcghnqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzMyBTYWx0ZWRfX3YewOnzCjdu1
 3bVTf642CS1a5NAkEgz2wrtrAv4S6aggxFVwmaK7x7mDZhKRHGeZrhKh1ud2ZipIeMF2cHmJ9is
 izlDULLIan8em/GkxgAZqZcuwBO01R6okHBffqO6kxcf1xok/puOnSrKz6CwOJhnwG3qWiTfPr6
 4b7ltI0IMYXLsPQlojfxU+RdPEUji+cciWMAZ3isrRorgiyjwOBxIDrrl4+FCX3ZartNdaOKEoD
 JTGUieiox62A9N1lepHYCP/cLe3RsyBuhB4iscKH6w8j18Fd7V0FXa+L7uPY0dWhJH5rRH3g3JH
 RblZvFdllGdivgHVaKSCRv+Gm9bHdiU1Lq7rkjZidB1pyp3g2tSqcW35lW9n2jduSJFe2cmPFt+
 yAbWS4A6kqGqqlZgJD4r6RfwzqArtSeXJKpitK030B5erVs/oHqgUSINZAWuo7Rpg8RDh/tuFkf
 +YNHtHf7iBtqDKKlmWw==
X-Proofpoint-GUID: so2HN8zC-EOB0TJhggNMl93rULcghnqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040033
X-Rspamd-Queue-Id: 7071E1FAA53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95248-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 01:51:57PM +0530, Swati Agarwal wrote:
> Enable the secondary USB controller connected to micro usb port in OTG mode
> on Monaco EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 54 +++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

