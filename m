Return-Path: <linux-arm-msm+bounces-106316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIcIAAtV/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:02:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 948054E56CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4948302C821
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63DE3B388B;
	Thu,  7 May 2026 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ID9tLEjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6e4O6QY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927D3B3C0D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144312; cv=none; b=hutfagno1dXnbyQm2RcD6PtdykgI5AGmu9foBJxHKEd38ZhdfqWKAvMF96aff6RDUA9tAQXXeF9mx0xXPHioX8lfsZWl4+Spn3zqSMpQcsVbbvp2D3slb2ZetFDzaI3wHdKeZLRw8DzEsT2V+xbc4CdI8YvwtHmBllbj034smzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144312; c=relaxed/simple;
	bh=OwBsLT+laZaiPCuphdcVdAreMTZfIIzwOQPcmZSMbk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUdw9PyESXT76Av+3n7ZDL/u85B8afrUZo4BJzkWaFRcIHWu4Cz/wQB3E/PYKrbB8qmDlqNyZhU41dyu8+1ICAbS8zwvsy7pNr56EPZJ3IGGhUr9GnO5duL3u3+qQlbPBrOsaCu5eIkW2Dtds05ixwzGIQrMZmP50JyBngXZ5OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ID9tLEjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6e4O6QY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wvZr1927314
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E30nslBrQfilUKWanY0eyysp
	ddoh4I0nKO1YhfVuGHI=; b=ID9tLEjrE+IrXIHwRvHsi1TjxBLws5E1lfYT6uaJ
	SqeKsZgx2rSDRrKm8VBpO+IQgn8tDeuZ8ZAoH/bMnmegL7Yei75V2hbOFBYX657S
	5iad0WWmT8QWxxHFpnfQa1cmK1WH/vjHgyngoPDDw2KMmF3c1EDfYmoRjGL0fSm3
	PC+lEWyssWKiF4fD+T+gI++Nmy2K0IlTB0jy7E1cITAo8QsRXTrCo7D20ie5+3tf
	q1S8Dv0RGQ1BUCTJ1/3/LLP3swGXS5aK8+mNvhO2BU7izvIsWExRjvZdQA0jLj8W
	Nil7tF3VbfVw2clrWWv/+WtPYZsvzSjD9C2WT9sQVz+W1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8p7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:58:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e575a50bcso7467521cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144298; x=1778749098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E30nslBrQfilUKWanY0eyyspddoh4I0nKO1YhfVuGHI=;
        b=O6e4O6QYX/l0+KHHdDuN+L9kMed0e81859Hjdz6/nHHWn1OlyjNwn5wFpIKdMU5lqy
         7dRRdRxHLXLxJq19V5LM9HLyIF9hFTf1diNids3Pkityr4rtugVAbTOMPRpoXuAnAGjQ
         tHkU+prbCcyxjq7g5JzCq2/uPFhNU1mueIGAnU5hT49o7gd2DGAqiXsb4je6ybuwptD4
         WA4KTdw+T6pInYRKcEN+j0I6pvpAPRFbSX0nKB3exsFa3z/d93BpYQrZi6NLvb/IwdSc
         41qpzMDACEtUmW+hXpndNm1R0JkX6pXEgJf/qOchADk6NlfF8wUkb9rJynqrlAo+ZrMB
         pFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144298; x=1778749098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E30nslBrQfilUKWanY0eyyspddoh4I0nKO1YhfVuGHI=;
        b=c74Xu5+U0CK6xthcPlOrBmlXem4sZ3E5mCtwCIO6H3LX99FZPwKMKTD9Ct5wQ/97jr
         cftPHsXDswRt+nzh+LQPJVb6jgVnIDmWES7lr6gmjlSyREA/3Zkw9gb9j09zANl0KT5X
         VLXgBloDgjEvgz4XwysU1HTDRsrmon0bJld0l28CWHFOgiqlTepgNNAuYwDDy5O3C0HW
         IO7rmJL5lh7AhYivUJa/TpGcb/Zh9Fs2svXPM2K2RU+WNV8W3/CvkaD6CrhlCNOEf9ZI
         MfCk9Oq+9nmjgcbPl4AvsZfo+KaPZaSvAs0+wIjRmyZnx+g5DJxm6Xu0/6Nb+RWkMqMw
         Q9Ow==
X-Forwarded-Encrypted: i=1; AFNElJ9sWNCSDqCKeJa6l/VB3v8Ui7/jSG+VRl4kIADQewKw1MKI8PUx01W/kQR+A9zBHXOsw1TEEq7Eg0vO2VmW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9HxnKVxXT+ju9vIPFcpD3gnJQeNFV0iYh4o2GvjOBu/YunjD
	6hqLy2r7gKzO10QCQ3edLWFxtWtpLz8K+dgN1Q6kDQCg5vol3IAhFwLh+VLoSbPnF9mAJrfWATd
	e/FVx2g56hrQv76+7cHATukkOxPGbdjSRND2YZmC7+anxOwWq1kEI1L3ikjnJKy8JbyOg
X-Gm-Gg: AeBDiesTweRdsOL6hO7tvc0SpKKri5nqGKIxO1jWLwBym2oWHTiVH/yozAPWNRaERvf
	W3YPHZIR8UNbLU6autgmy2nEKU3WVSoJi4ngvN2qsfHkg2ow8NVs+4l+WbYKi2n8zF7snmDlRsk
	Z8cYeXCDEkK9PGAG615IAk71BrolkY+K6ZMBq5ye7nR+xCC/Yjywsg2eL9VcT/6yiN1P84xkYED
	Mc8Z3ru7uyKtrIfym0fYc4SQ5A8I7ERI3h3iMXD+Mwi6+T5nZ2EwPB+DNbcxqMFYNETNo9LZ0iY
	sCAK2sfs8V7A0qkb4JqkjPeKB7Jk4MzhWnajS5env42ktUObrZDt39zrrABJhrhxi8dySHmhjbQ
	xQ+ALu9d4uT8bF7qMce3muSZarzzb1BCu6GDa6JjCmqZ9KqE=
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr100491971cf.44.1778144298228;
        Thu, 07 May 2026 01:58:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr100491401cf.44.1778144297399;
        Thu, 07 May 2026 01:58:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b19besm36764745e9.7.2026.05.07.01.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:58:16 -0700 (PDT)
Date: Thu, 7 May 2026 11:58:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
Message-ID: <j3pfv26yylt3a7fae6u2fozbko7wvy4gpleogyg7sg4pqp6duc@bdagnq7gcsr2>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
 <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
 <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
 <486d6b30-8762-4f14-aa19-7c5497cba00f@oss.qualcomm.com>
 <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc542b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JAKgS-5HGXHXDUih-usA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Sib-4100elphwjWY4k7OaY72nfV3i3LN
X-Proofpoint-GUID: Sib-4100elphwjWY4k7OaY72nfV3i3LN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OCBTYWx0ZWRfX09PicjhGeDhI
 mHgG6UyJMkjDpXOzRyM/6ubmm2lNOUqCifqcVBVNZUFUscOskVrHzS4//LiZ5rZ8dLFhdRWmivl
 umhmWz5NN22ag10PI02hbSVD18UvgxnmJgpXffvPjJAsnHShkh0cLEKwCmjbT6ACjnlNep91PBZ
 O/PZhFtJuUPfGgd7WYzFVGJ2U4APg9oJP3lFAD2LBvolCpQfl54McEsyrjvNuQyd51Lk7b1jGwf
 ZZUqjXg5lQGOh8BiKej6xULkAmzWQxYwflD8EtYo2GXAH2mDw6fA1p8XJ//l/uOtYgAphw9LMU6
 a40qauUkaNYxhhfjd5XhgKF9gcYQFTs4ZB2FGTYPPeFZ5s7x1eKKDyDadNINVZwLg4/RMeYaYkt
 BE5MvY5QisB1X47iELt0gjZtW/4+o0/J5WsTLx9Jr6AUIB6ZAyQe8pc4qeLsa5X0bF7Dgr4d+QK
 RmQ+orp1Jgs3IWiywvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070088
X-Rspamd-Queue-Id: 948054E56CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106316-lists,linux-arm-msm=lfdr.de];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On 26-05-06 14:15:57, Krzysztof Kozlowski wrote:
> On 06/05/2026 12:47, Konrad Dybcio wrote:
> > On 5/6/26 11:56 AM, Krzysztof Kozlowski wrote:
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        reg:
> >>>>> +          items:
> >>>>> +            - description: LLCC0 base register region
> >>>>> +            - description: LLCC2 base register region
> >>>>
> >>>> LLCC1?
> >>>
> >>> Unfortunately not
> >>
> >> Then let's just skip the names, because it will cause unnecessary
> >> confusion when name is llcc1 (since it is the NEXT entry) but it points
> >> to block called LLCC2 in the manual.
> > 
> > I don't think skipping the names is a good idea, especially since if
> > we keep them, we could teach the driver what channel the region actually
> > corresponds to
> 
> You still can do it, because indices are fixed. Names are only helper
> and makes that easier.
> 
> The problem looks to me purely doc-related, because this is logically
> second channel, so LLCC1, just like qcom,sc7280-llcc or
> qcom,sdm670-llcc. Does naming it as third channel (LLCC2) is relevant
> for programming interface? Imagine driver taking LLCCx and using the 'x'
> as offset?

I think it creats confusion for someone else who will consult the
internal doc and see the difference in naming.

