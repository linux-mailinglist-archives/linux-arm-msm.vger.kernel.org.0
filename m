Return-Path: <linux-arm-msm+bounces-92490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG8oOBAhi2lBQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:14:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA6F11A965
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3E773038F29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4767D32863B;
	Tue, 10 Feb 2026 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBBLPDq8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFbUMKod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2270A328617
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770725644; cv=none; b=R/iTYja8Bp2hNqp/MbbCyQsgFPc0x7NM+RDLNU/s+06haF1HrKQW5t1k0fQKnxhAyqy70wlOZMRnaO1MFIfYGNpFLQmvHXRj0HTHLF2UT4IZt23oFaucIhkQ2yeghUH1JnH0Hi2u5z2WX2HU9cnfdIRP6Q3HOtcSd2nARjUe+Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770725644; c=relaxed/simple;
	bh=ibg5Z5sNlI1V5hopvxZ6n7KyKbVMe6RnGme4Ln1yk6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQIPJzLqavgZ47Pj3IFuawBh/l3BlaseYqZ8kp2gNPn9625UlTat+/gdD4GsKufliO9UZa3Tv+AXcB1+RwEXATTUYEJJ5J1rzQt9lOq78YP0WavIyYPpMKk41TFqDUdHWawiqvsPWBf+M/5xg64jxEw9gpCP55HUiKIEy0mkh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBBLPDq8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFbUMKod; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ABI1oH801165
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3mhxAAA7pR+6yd/Is7X+V1Ot
	104elKM1yy73mC58os0=; b=FBBLPDq8nlSoicUc+uXedbM3vibJ5we/Ff1z4Nto
	30YU143KUosJKjPGCrDR7/gqvk6Ocuz5NszYE5xqmNZA1lR0tKbifPd/noGl/mHv
	p5DzfwJyBBRdPV2/2tcj/L8TeENf7C8J2jxXAVVtVPuQ30mXWh79t4S0ULSKyPXr
	9T4EYujzblmUov2HwqcZ0vG/E95I++MAtj+X7OaGqiyR+7kEDkmNavHDV1sAeKYh
	Q4qSaEbieLWLJm/cHmmliwky86ptUSFgfvHg4ylTGB+26ON8214mpxMchfqZ3v+2
	/Zn+36t69ip0SN0J1/sxBgYV3Rqyxl1VU9QFfjYWjCrO/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u1ayu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:14:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5296c7e57so1586082085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770725641; x=1771330441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mhxAAA7pR+6yd/Is7X+V1Ot104elKM1yy73mC58os0=;
        b=iFbUMKod58U+FcH6IhMnF5iO+CrsvOdFFHB3GXLVr26jb/hvsrnaV858H4NThWpI4i
         1H+Zy7qa2DqlHyWZhOv8FXknmk3INe4+h+WuWL1kEynY7puNhHlpW+i3FnC5fQsOQ8gV
         i3HFS6lAjUuEq3Lo0/rmA9sk8FiP6oEXPw5BZpg/41kT0I9Vr91iB2mu7+ZaGtUt7PvE
         LSe2AjDV0n9Y3wiOQ3Q0kCS5AcXbyyfA/3byK+sWIyqqCllHRRJ3obzxpJHvas408/Gq
         6iu6LBNPhY1MrPYgfvDJv+m4IL1qTOLfQzyMcUHrWv32j/1ZAfZSSaU2j/i9He/qPVcr
         HTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770725641; x=1771330441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mhxAAA7pR+6yd/Is7X+V1Ot104elKM1yy73mC58os0=;
        b=qGTLEa+cxiHQOwE6FRK1ujnKGoTtAPonOthBkSesnqq8g66SszcArfDA6e0U7uxPZt
         AP+bzuWl2QzZnCyonxulbZTdRZAOO3bj0Gnpo+SHQsrOV2KqEtwDUIHF5v5I49nyYmYl
         RY7tyYGqIpYBUK88rdaMsZbUjelqNMxKlQOt40XkH/XkGzNSA8OKqwwhZ7VYNCV3E+Wl
         C03ezFMRjWZgXfoCg6AhnF2DDynkCiaYftH8ymUSdbSvVz0cngcIelMzoSEcJAqCz/sI
         Ivd2ySnqoGblaOH2ka7qLNp8UIyv1IPZLjtCdBlRr+w9EPiRFMPxLVfhQ3ZYkoeFJdF6
         q5Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUJKlci1j6VT9s6K5ay68jBWDVbfSQrR0xl+ogE9R37MSxhkZgSCJN65XBVCV7bW98U7v0OZj/PF/RToHIa@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCH9f33Bp9o8743uKcmQmkDqPE68gzlaOzAZQljr+I4UwWVh4
	zxI4JxeFCQfaeUfGZsUTRYqVNFCPUjjxSQZCzTZSf9Z8gX6/3613D7h5b5ch8kTpcmYIqDj+c4J
	BvJSPX3ayq4Sp/3dUFI0k1sIDRjAxRxE6c3eB3MH97Dc1iNq7CJ4OsPrN4V97U7HYKrZi
X-Gm-Gg: AZuq6aJd7ZHh4DMeRe6FMtckvxRvDUW16338fg0bP4wRWwd+IxfshCLt3EQdHFVwica
	bpBoXXbRIJ7ODGdF7GcHNuymQ0Cl4aFt95w8ph90gAgvd27RuxlY1t+YIXCDd/z9hpNE/qwpwVP
	T8vnNKp9yiDY9UXLCFnObece5Nv2HPYclmjuLfn8Qt03Q3qpD3Df4Fd3uFrF6KuBTOuwtD67ENg
	Pq2LOGASdlZwM9DP78ZjAYRX4/MHiEV09INdcHUpqg4I4org9CZ80ZoDkhqoLGufNeI9VZ6v5ri
	I3kqmABLkjwBcTXqrXSqN6Tf67CY2WXqKoEAKPAUuI8dN4gPDvDPfrb/V2Bz+XSMJ81Qv1jgVoM
	SC+xwGYw5cgLaVZ5hfZ+Hg1WrhVUPtL766iLJaUElXzD81BK5zclJet8O7tQt19F31ehGJZDCCf
	2egtHcf7Lp6yq1pYRAsDG4MSKJxv2tG+cMlhw=
X-Received: by 2002:a05:620a:1998:b0:8c9:f996:8203 with SMTP id af79cd13be357-8caeef2c1demr2162185985a.13.1770725641229;
        Tue, 10 Feb 2026 04:14:01 -0800 (PST)
X-Received: by 2002:a05:620a:1998:b0:8c9:f996:8203 with SMTP id af79cd13be357-8caeef2c1demr2162182685a.13.1770725640787;
        Tue, 10 Feb 2026 04:14:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21982sm3293335e87.71.2026.02.10.04.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:14:00 -0800 (PST)
Date: Tue, 10 Feb 2026 14:13:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Bluetooth: qca: Refactor code on the basis of chipset
 names
Message-ID: <5fqaddyc3xfpqe2tb7amc2xwhgq4ytekkjheqvlcmf3qjjslxk@q3d2sgff3xl2>
References: <20260210120101.1046091-1-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210120101.1046091-1-vivek.sahu@oss.qualcomm.com>
X-Proofpoint-GUID: 1nhNbf4XC8QdSSVk-XbuvGfIA7xS7DyX
X-Proofpoint-ORIG-GUID: 1nhNbf4XC8QdSSVk-XbuvGfIA7xS7DyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwMiBTYWx0ZWRfX98UAYTQPdIxJ
 beM+0G3csuTEA+sIN9Sy9dQEYzaWmRrqRZEV66OppgunpzVcEbaOXbY8NR7lVFj4/8HrDo13pRw
 GzICb4SzsgHPHHiQyRqJaVf/arbeQKVdjxzIMteWbx1jS/ODMBH5fod92MG9dK5krCki8fzqRjM
 b2wHFsA/x3TD1Ju6fB5HvxDPWFHXFNCe3UO2dajMGItSGKFq26zWTGaK2kdOtNZvbRoW3lXF5aK
 KQFw026oPPzB6P+Di5WT1adEW01JeTYfLQwCc1MuzR4ST448Cz88xk8Pyx4k9gbiQoxlLZMlpo8
 YZDGfvaeO/fbs+4N9637HSffwpkrAnxcwOBX4e0TDddNDGpdMBP8PjJz5pI0n2XITdkJmQwxCns
 kD0affFuWR4bGa5U0BkwUoHzqvMtnAPOqdCJk7G/Im4KOIk/wayC2jrQBQjRBVI+n7DBUQMqHPS
 702mpFLClaEbvojYDDQ==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698b210a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=gBihFXd2_hD-ogQTx7UA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92490-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AA6F11A965
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 05:31:01PM +0530, Vivek Sahu wrote:
> Whenever new chipset support is added to the driver code,
> we ended up adding chipset name to the last of the switch case
> arising code readability issue because of improper sorting of
> the chipset names in various places of the code.

If it was true, the file would have been less oragnized than it is now.


Aside from that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Refactor code such a way that new chipset can be added easily
> in the code without compromising code readability.
> 
> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c   | 37 +++++++++++++++++++------------------
>  drivers/bluetooth/hci_qca.c | 30 +++++++++++++++---------------
>  2 files changed, 34 insertions(+), 33 deletions(-)
> 

-- 
With best wishes
Dmitry

