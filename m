Return-Path: <linux-arm-msm+bounces-91761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB9oASS1gmnwYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:55:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFADE10B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 390B23036632
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DF12D8DD9;
	Wed,  4 Feb 2026 02:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6kMhbEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKpRcWlq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9A72D6E7E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173697; cv=none; b=nR3YfZZqvxC89fqz39WCpmU7+B6Wie7HcGFxoURNAZMKxHPrnR9Dsv5OuWWk4TaV0AdJVJRvUIYqsxEwJNZPCdEqqosmXkK4607ECTtEOpv8L2KTkpQJ6zJGgd31H8CDz6iJQvF97l3wvK92ZoJIIm/E3wzBjTvQJA9vDkKtQUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173697; c=relaxed/simple;
	bh=Sci+o9Tmpw/PiRCLomTqt2n/SzCcPtwFAF4jsayDh/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zdejo9KCouOxfu5NVmxLWxGPkX5cq7CtL7LtzEF1w3DQ7nuwazmJESYVlr9ilHEyVFuUx0tRE8kU74WmCraAvf9Dd4NRArM2HXPHjoKe8+8v/rII34LFsdbACJBJKPbGIf8wEdUrkGSDSbdDujqXl0fmPFtW1OozPm7xsFaW4Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6kMhbEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKpRcWlq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlwmH3337217
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+j6SguhaYzORmSzDa8xgmnK
	ds4ecElxzr/Rlmf5Gwg=; b=e6kMhbEFIJrDP3SKm6dYZ/7e+BXcO8aSdRDPqkgh
	eTKpbnfR8/Amz2UhdFrP7z3QAFJvOjyhCSgfRbTniSpHutrzZOctRQXNKINN8yak
	YAM21Fc8fi+O3Lmdjl9hcK6UVgDswJQ7ykzccvCCL4RUXzjod/lZ4LKaOg8lTZa9
	cXS+n0cdILbFUxai37WSC/CPYKtnMw4HourmGz2DD6qL8P+ttyKnH5TprohT0rxn
	J2B5lKk+DWgowOe27bhHFqnXA6SUOAirwOYKLOne8b0bIrhUaHLa27DbK9gqGIpk
	0K+zVYIZOb9vOcQv9EsvEGqfI3335/uOgcDvvBvnAIQSqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gewaqxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:54:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so1729378185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173695; x=1770778495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+j6SguhaYzORmSzDa8xgmnKds4ecElxzr/Rlmf5Gwg=;
        b=hKpRcWlqGwSjJ3pvGrAZmj1Lz27vzG5ML4q1xNotB/1AUxZ2PtNOt7sJe5OvJzDd4s
         +wkglpZAasiMa2Me98rbvW3fQRMgZ6I6TMMQ1iUa4tzVL9dlieEPQwUSnaqoSo3vDk1l
         xfj833KUxnfWOp9RCwFWUHfY2OYioL8lXA9OT5D3zvkxz0/K1sKYAX1Fpo0Ahu2W7x89
         UkUFK3rFrVqx6KpwWbytyjXAIYg5hBSKGaMGPDhxLIBLFsBymU6eHwFQDXtNnr/7Iowd
         vIhw25aki64AQWdhLzGmNQqHJN81da5rBwBeQAXHEJCVDbAcBXc46g3it5ojL8NafssD
         4FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173695; x=1770778495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+j6SguhaYzORmSzDa8xgmnKds4ecElxzr/Rlmf5Gwg=;
        b=APoraXaDzqhcT1eJnKNjzWJu0rZqKYVjAKL67kYLbuDcjcfqTyBIYSYjNyUSmPPb7S
         LFU5XVRdpq9KeLmjzQcb3j10f1kZ4NHL0sVE8jOOrrBy43lWzf0eN522fWzfzZIjxAIB
         D9OKeQoaTWuhF8p+0xK1DENiEZ8IgCk3PoTKVeRRqI6vbRT7oLlmhQLWs2YGSyZexs41
         MRK+FpgAOxLuh24CNdWAGZD/aUMrE7nHwGHYm1LEG5GIuWxAQ7os8p3eYGKyY/yNkcAn
         YuZ92M6Ul1/K6P7MGmoscwV+5dXWpSisefdql5ugie2CX09TWknGKg4lauZLtlTqff4T
         yWyw==
X-Forwarded-Encrypted: i=1; AJvYcCULu4NzgS2ksTE7vh+e+KE81oa1DqqJQpuE+Ofu8y4+49lrEunWVg9QKaO5Xw8GxtZBdmPVjpjVEai37uBf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3n8zQCqLcn7HuXwCLisDPtf91rlMLV3uR3Xs2lFr43CBVeQGA
	m8abjP9Ztwk8yijdhVVqOrgRTWNoUUUrRy8lDD3HJy+aCpV+6ajssn/gzEWJvs97iWdqTGO+lNA
	t8e9F6ILGPb9k+aXkteQHRRV5YzMny0QiWiTgzYHHWT44KZuWtbN3l2IGYnXsmDkNhow2
X-Gm-Gg: AZuq6aJOEGV0bu5WNDXUzKZ+LKODR0aHDYrO70UBAhAMHLIKMsBnZyvZzdHuyH8LjJK
	GukV86A/QjxYDRSBLGZU6eo6HjoHTUN7eeiZN+AP2ZWMJsiRjd1pZNvgdC0W0aI32xHu3wZ+b73
	jz5usMNhHOECJy98DYjuehXeDz7FvHEHyDZzluVgG4QJuKkkbaCc87c/2mUNcfXPp8R3uUhg0J2
	SNOwsmsZaaxba46LIRLLnw2/zBcIMITp+xGPR1n4i6dXt/CmHkIsTBusFR5fh+ZiqCYNXrQFeVd
	N1kz94pKwdCAjrukPxFQ5M4UiQuDaiGtqfsqPbzsSmMVvIoPctTXLltTgpHFhy/N0QSKIY8iJl9
	zO+Azj4qJkB+JBaclXphJUA92o1o/F1eq41R7yNC25qeZGjly30XwcMvQwwemAi3HEgiigQUaNY
	rIeCQiCC0aN4SyXxzsFIhGoNg=
X-Received: by 2002:a05:620a:172a:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8ca2fa5e519mr224512985a.74.1770173694611;
        Tue, 03 Feb 2026 18:54:54 -0800 (PST)
X-Received: by 2002:a05:620a:172a:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8ca2fa5e519mr224510585a.74.1770173694050;
        Tue, 03 Feb 2026 18:54:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e39710524sm134530e87.63.2026.02.03.18.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:54:53 -0800 (PST)
Date: Wed, 4 Feb 2026 04:54:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] interconnect: qcom: qcs8300: enable QoS
 configuration
Message-ID: <tp6xpuur6a6ekb2uy6bc6vx62iwwfiqzoxk2hl56njucf7s4ef@emrbbuhsy6pd>
References: <20260127090116.1438780-1-odelu.kukatla@oss.qualcomm.com>
 <20260127090116.1438780-3-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127090116.1438780-3-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-GUID: Bzfu3dy-9Y7RrqYNUq6RxBDEtf0iOmNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfX1mQreO40ypbu
 sDmH1G45lFXB4UCiy2TYJ7EsoXuDD2OC0roQGohjHYK6/ct18JLnTDWgirVkpJI9v9AbLTFOAqZ
 pqGdHvW6y0hhGxzoSzNwjC6Q0g8lMTqpDUiRUEGgpsnlAhYNTTnTg9R5VSHBc81NGWJIZcWpPyv
 QyjFWYCHuINJ3jx1LOmtiBY2kdX3MRbQET8JolpM/51bSYOwqOT4fN8avBhvklb0s271IdkRI3A
 lh8j9sGh5REKE5zGlwWxMT3KYRs+SHH5ftbA/RRd/28KJ92/T9RlBD17N8dlc0TvuA2hh2siDa0
 WXVLxyp4C5aWSY/Zg9V8/HlmQT9b88nuSSvlP19mk9hP/Tsocgzp8WrmB63izFi0g2orxFUJW0L
 QdNI4sWDOWhPvA9TUxNEtRpYuLPVmnNSn1KSM/MuY/Gk4YkExxGgeqrXf/JGZnhWLxxxoU0NiH+
 91lh+uvrNY/p5T0jy5Q==
X-Authority-Analysis: v=2.4 cv=XI89iAhE c=1 sm=1 tr=0 ts=6982b4ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i2ZByRJmBIJE-cFrtQgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Bzfu3dy-9Y7RrqYNUq6RxBDEtf0iOmNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040018
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91761-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FFADE10B6
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 02:31:15PM +0530, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/qcs8300.c | 375 ++++++++++++++++++++++++++++
>  1 file changed, 375 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

