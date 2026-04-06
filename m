Return-Path: <linux-arm-msm+bounces-101910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 18FpAGIH02lNdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 03:07:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDB3A0F8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 03:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54AAC30036EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 01:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6029C21B9F5;
	Mon,  6 Apr 2026 01:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTPczUXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+44phnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A5EE571
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437661; cv=none; b=IpXTsRvHFwEV6EkbcdK8yJqAG61bL/pgQD37WvFoI2sY0rwALNuT1kloqpEmBBULoGEJq11v943MMkgbtpDMiHKH0rUL8/EWJvZU67nhXiifKQciqVuSLuHZ3IxLMdUUnvHGE18KxODB/o1mXSgja+AEhNAHMg39U7nojB8CXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437661; c=relaxed/simple;
	bh=MKJakbcmNxzxGdWfBKjHf0cp3wZmHZVEk+QzobVnXVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfcDACyXiEK46KfAlVbS85SKhRcfchTmU+ZRWCs0OHt8vsHLxLRLeR5ZAABTieQpApZXkfLMccBoXz0GWmNgnUXZ0O0bdB0y0cS0wtxndJoieR5MjQIKUSekWbLEoSak7nJ777wG/DFNJQhiAxsvyT9a4bPwnr6zQeFWWx92TiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTPczUXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+44phnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Nj7Ya2792356
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 01:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4f0uJli78TMMK8KUK88YYviB
	c/HliRox1MxKveOYlmM=; b=pTPczUXIatcGJMEZcoduD+/QPvsFTVa+j1eCGVQ8
	PH7VCTCjxNLeLEjIIZcBrRdE6h25tTMuaHdmcIiD9r8TIo9n12KVi17xaZgLdacE
	bJPBu2wKnp2QvfBKyYL9B8VS1k2zpXBTZUgua6n1SZRnEXYA+Lc6Sd51BC5HW1iY
	pVbGdP344h+40xMGxzg02ctlfDivc0vPS5xeU74VGZa+v+wvv2mVkJV9ajlyACs2
	becXaxwqiZuCoN1hvsvBM2gw7a8SJdVfElIBjA1Pib4hy0Ddfrp+ZYvHBL9/Tv5v
	vd7FZn67xzW48uqTYvG76TcWc+0nAEZIfF/uRklTjMNvqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfkqka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 01:07:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e4c29caso15264861cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 18:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437658; x=1776042458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4f0uJli78TMMK8KUK88YYviBc/HliRox1MxKveOYlmM=;
        b=G+44phnpEZfuPJxkIGCMEy3RIEJR261f9N9o2/lw4dJ21MnvaIGY6v0Y/p7XIO0h+6
         Qy3lINdpO1cBFqZZvBFd2xwfO0Foy7ALjY7NO9uUVj/2p0YimZPlXkuEIOgzlKDBMU62
         f3y/+NSPZMHeom9SjYpH5JeTe29AVcDZSBJvm5nkLDRSBVNKps6qHnDdjf/DHt7Dt+BM
         82Vez80ECagMidU4Xj/SoucKjh6ZUBSxHd9wWZ6SK3qgIxDAtIPiOzEefGvDMGmZ01BF
         5a1XzTf5V3uaQvBdWR4GQMt1u8sQjrLBysoJ94vTzYBqx2TfkM50I5uPyUJKBRyLVwpr
         p4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437658; x=1776042458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4f0uJli78TMMK8KUK88YYviBc/HliRox1MxKveOYlmM=;
        b=lcL+P0eElkUTgcyK4uxmnFlYuJTx7IRqPAv6jZlQzP7Zl9OVUt6NvJ//egmg8fRkL3
         OOGY8yBG2vH01DjgPgU2gyJmqQrDL4dGMORj1xkG27XB8jsMLtFBjww88yX3dhmeC9q2
         ECrbwDnD9gsTWZP0lvMNlTb3sXlbN7eRPhnvOPveiw1y6PCyRlBIRQsf3Hn1Eo8IDjg6
         Hus6p7URaxQNrcgWGMgR59IufhShhQfMTEyJY5y45zRLoojLvl/CrLOObigQAoSf6kMZ
         J1aLQ1+E5KHM4twI9Q93LP5brEEF1hdwdcFTogzVRVBXOOgrAUWSrqEW62f3Vwr6afZ3
         QSeA==
X-Forwarded-Encrypted: i=1; AJvYcCXrd5N+t23lQ4MJtCvKIbVwtxmsSRb860LFNsns3T92qIlrP9cgODtiE5OxFowbha3GBsmaB3N7k/elmpad@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzcp3pET4kV85HKrLc3JckTMeaZX7OIsV3QPXFYJ13qxRSzgP4
	qbSx4LxtI6xY0BXT+2IpMnXvqht5xJIQpN2W82gbmEXU1SljW0+jbL5TIc5xHKedUeUWPamXQK2
	ODc0Y6BMsd0MMIIu28PbdHT4i8T4Gqt7RGlRyZ7Hxy89iMW2qq9OSd6XKYaoRyOS6A+CK
X-Gm-Gg: AeBDietHGHr2rxuU+cz0xb/oD+4nkawfxQJGw9vApWJD89paVqCVkhoX1GPnx2qE0eW
	ka/Wnk85jqI50SbbOYZj6v4thMDtS0LLpjBd1GqzF1pj5zt2g/BXLz0YzesVX9PZboq1s4Lk/nn
	jWpdkZBdY9V2o9H7ttEsgmJhv9fd0FI01c/3N74iCIxErjF8SKgJQH4nlQfZbg2KzzXM5jsnMuD
	EG0wCZpJoWWuZ32KkIVk8WbZ89Egh5S6lueHNdrv5LWB9ZqV9hK3B4kAdI0xx0MjLpNa+Q3j8bK
	9vGA4+7tKjO4o/Y6LzxEg7W1LtEGEIWUqZXmK2sM+DQtJ3JBNEGtNq7+5g6XVTH7mmpOTNM7xa3
	zFyDdf9NJQcHgGRKJPvwIJSwaA46dL2aoRB/ErYf6NK8xRq7xMuKqgLFqsbKPbiRViYFRD2NeKw
	WmpLiSh3ig6wEUSTY212/5ykK/nO9YgZxwnZY=
X-Received: by 2002:ac8:7d02:0:b0:50b:444c:e268 with SMTP id d75a77b69052e-50d62b4bb01mr180596561cf.19.1775437658530;
        Sun, 05 Apr 2026 18:07:38 -0700 (PDT)
X-Received: by 2002:ac8:7d02:0:b0:50b:444c:e268 with SMTP id d75a77b69052e-50d62b4bb01mr180596211cf.19.1775437658103;
        Sun, 05 Apr 2026 18:07:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdff47sm28106631fa.13.2026.04.05.18.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 18:07:36 -0700 (PDT)
Date: Mon, 6 Apr 2026 04:07:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logs when reading values
Message-ID: <ddxrfazpcyert6m5k56facwy7wq6hlji4fq2zotb5lfgglxzjf@djr3uwixhvi7>
References: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
 <20260405-pm8xxx-xoadc-label-v3-2-9fe179c283ec@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-pm8xxx-xoadc-label-v3-2-9fe179c283ec@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwOSBTYWx0ZWRfXy2gfhVoGkDRI
 mA6yEHGI6/5NZ9ngh0V2E6Ff7Tsj6Yg9E1WbXSlaEBCwskK/5ByUqzqBA3HGaXPeqpP9acESjxM
 BHjY5LJ9HW5L+DfNkeUY+mXTydu0iSKe5gGxN1q8BMBeafMZ9YvgC8Tg98d8lb33T6DAAfcY5FY
 t+s3CBgYSgrb8qcg6D4ZWw5LNdIugKwYUKpyBNG6S1HvoJdMlQb0umsmC+yZN76eZgnFvqAbMi0
 pvW3DiE6YI+UIGU2BqJdqeaP0Z3EvSAllLJ5lKbocvuimMFxrKk4lLFPUe7QAM43PuBx3DoE5mB
 WdCo+cQ1WoXRF53JyOC4EMhyv6oqA7iFfqKHv13fV8E1BbfJ+xOTD7rMe4Bev0gIUCcRCRu9BxS
 1dRlI+aTWFOx9RIiMNzKOreM09QfNld/xOLXF0/95BwpUFnKs4W0XWJbveRNMwgW4sCHLcQOOwC
 GqevVxZvFrCtSm2DCEg==
X-Proofpoint-ORIG-GUID: qNZJty48E8DxghNvCUVxB5NG16kJdGcl
X-Proofpoint-GUID: qNZJty48E8DxghNvCUVxB5NG16kJdGcl
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d3075b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=Jp7DWZVJ8eVs8d99wrMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060009
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101910-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,smankusors.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39EDB3A0F8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 04:52:18PM +0000, Antony Kurniawan Soemardi wrote:
> Drop dev_err() logging for -EINVAL and -ETIMEDOUT cases and rely on
> return values to report errors, reducing unnecessary log noise.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

