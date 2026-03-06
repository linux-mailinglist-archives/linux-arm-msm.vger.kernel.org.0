Return-Path: <linux-arm-msm+bounces-95739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO50JJKYqmmIUAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:04:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 365BF21D950
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AB76300B1BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F7D331200;
	Fri,  6 Mar 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC7Ygr6l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFTLwCDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6903D33A6E2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787854; cv=none; b=n03IAWtjpbSGYxdBLrYhI1vUh8YrglERODnDd2hbS1TSPCMja9AeSphJVg5g6JVEcKMBBVN3FK8DunP+d5xYTpcbQhKyQnpNk0Jo7sCUEvBgNqgGDj3J7KDPFe75HG3bddlaMR3OB9r42xwTbyrN/l6Ilzu6rxcMmErAI4Pp+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787854; c=relaxed/simple;
	bh=bLstNJfZc8Y8ogBlEfS8cD2qtNMeGDa6kXMaJvKrCI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKZj+jG+pOkAKthRUmDeCOaBxjSOhVxY9Bg/DwvdfRKya2hPsf6L66mOOqbmRy8IS/1V47iwBz/Pi7+0YpIo9DwxIEdrnr7AButflgJ9PjQi0/AFgYyWl7fpRy4hBh+sg/W5hAnsVaAzOeE62U0RFJ1If5wUwcUl2fIjKddnjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC7Ygr6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFTLwCDI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aejJ3886823
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=; b=ZC7Ygr6lpr2kAY8X
	IgeJ5VxLfrx0j5WmTRV0Y68+fmxoCbW0F4G9ynmzN3VnGUECIG5SE/b7Wwii9Rxr
	Pc89fgdKfkQBDrUEE3oOMSGC4UCgaZM31DLJ+Cjv/zPGjxVl4eqYYiDC8jVyFJ7f
	Q6LkdL4nWyXKmAHiARAvyCytv5AtniFZN+T79r5GmYKVIRjygIZetPOlgDqspSwd
	juQqKYIwdobBmuBxS+mCA0lNi8DdQpxq9ixowtHN3kJwAeQRmzVTOrfQVzeg2axd
	+h0lorD7rnvQ0/W4d18fD68R7acYYEKlR9harMg739oQarhcJMPHvmlnjOfzoYv3
	32aJ7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4s9ykc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:04:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so612538485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772787851; x=1773392651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=;
        b=QFTLwCDIidWIMPkFNfcvk1RmkjzkJrJFdeMvMbgdEQ9nVokRbIHSWOgrvWYhEapyJ9
         hwGBfOL/UoAuYnnk4VoTx59CnTroDdD8xBz7hQoHzfqdWW5NxepRhgm61oARhxswYQAR
         cxgRdmHk3r/02ZCDAYRINihtVdWhSfmcxEkUYGGheAeS0oJCxdYAvTOGTtpQ0WVFGwZ8
         VP4VaCO78lygXzG/QU2vKVYqMOo69ndC6xIr+ZHpHIlTeyh/t1SxKEFmHsbKbsvOv1Jj
         mZpEWD6e76U+3LdA5xHbA+IC7NmmNcNWMk5nu4hdBQuUIeUpuvwtyXBmmBcOVthmCkBL
         HzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772787851; x=1773392651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=;
        b=c0DLqo9BUBA6Fcq1Rj6kd7xbzHg74shZ8klcoT6YTVe2dQdHVQtcv9Pv79IGWRzf08
         v9gKdHu+oxcg0gPi2ZQZ7CHK5mHpQooIjoOWo6rMPoFGeeM8278SOGxS0iN4cWYSdlKX
         L6EJXkplPKq7qBslGR7MQq5soAUEZND7DagWKxccc2UWCML3vbPHpcRs8TkX9SZXmXXo
         h+olC1kpmQI05taPL4pgtj94WKGSqxEPVFRLqzplS+CiH9tFDhXR+KZTgsEU/Tnmbbtm
         pbFgLlz5ID3kwINAmQt8Z1i8fNB6rkgYGReuEzjzuiXyPih9XdJccEKvhS+ptPZps1TX
         VwpA==
X-Gm-Message-State: AOJu0Yx6WMkm/pnRK+JrVQJKptdquuDUoj0ky0/r5JbRR/RP7dEhyes1
	xwEnlCbyecKa8pQ/oR5qqyIa5fhj6LAd9oz0seSnEzdiied9gN+O9O1gA7Nv6aFetmNLKW0DRLI
	63Ij/zp/fuMPOcMOpwa9shNbsJQuxzI1Fxtq8BVUgYaU3i6tMKamCyzLNTt5qhul3Ne+i
X-Gm-Gg: ATEYQzytNra5F6AAegj1+l+jIhRxedYOy3y8NoB42MNaGZA0jg2KBrKBq0/65xVfXb7
	PoADdnsoSlbnkc6LyAMnWm7ftoaEXjAaeOdzDGTzhEh+HZn1x4Yd2gu3tSc/JwqGOcVQIuBEWmS
	sTn2G536etphJRrVW79ymxpt53XmcpG3cZ59YU5N1yUgeAHkDaqvhLT6zMRgKl7uk1VXa/LNH32
	z0dGrTucBL0eS9OtoK0peod/0VCJorCjnWcG9mQEzKb4jnSYHjT46+9+1H3wQzXOAH/vvxayv5Z
	PdO/HjvsXrKk9qI5/WDnTdnuOKkRjRhYzJmIH1D5n8jqw+WG5HpqF7DBUuLWTs5oFe91gbfUKfs
	g3Nfq1t3KPRpR5SJoAX5rb59j+Gl5+yLSjPVLzoVLPoD7ayEbtrX4KNuRL7u0+7Qp1evCmGD6ga
	3v47E=
X-Received: by 2002:a05:620a:4892:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cd6d43c6e3mr137000285a.5.1772787851215;
        Fri, 06 Mar 2026 01:04:11 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cd6d43c6e3mr136997285a.5.1772787850777;
        Fri, 06 Mar 2026 01:04:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94351894bfsm16204966b.1.2026.03.06.01.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:04:10 -0800 (PST)
Message-ID: <344eea89-e7f6-45d1-8413-dc238a73f200@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 10:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NSBTYWx0ZWRfX5qKetchXinHv
 zfT+h7oQgU4g0vbtujkji2MYRVfR+yJsVDcPKZNBbyr2G3hbgkK7TolO9ej4nn6wE/v203/L3t3
 K0yvTVCGscTdWUkTbFw8fZ5J5gvjpmWCDzdGuniZdfPtRCnlHwu6H1I9opDkK30b8u0hy5UhiBB
 TnrLu7PvmME9zCOamhz6o4Ihsk5eQhI6B5GCZL50m3gRdUQicPgxEVOoURwzlduBZm7pVYnBMZN
 oP8dmJ9Mg92y2smAhsbDncU5Ikbxf5Cxf3AzXAWvimTi1jLTl9sojrPNovwV22Y9txwScBHKWdN
 9KMLc6Mr3KEWtglehbVH66mvHDOQtJE7HaOOd7PMEzcmz6QLovabGzGh9tT50ZdtLH7xsyzPmbh
 ZogvVyo6461krhGJVVN+XaC0j8uMOsD/+tnuGPMvqwPrrr8MsWNpGnZ4NAMKXuWMHxGO6zK+qOR
 bDdiIrR4LjZetgzGjog==
X-Proofpoint-ORIG-GUID: AM7FFWP70t6Es1eOvHoS9WvVCJ18_UkQ
X-Proofpoint-GUID: AM7FFWP70t6Es1eOvHoS9WvVCJ18_UkQ
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aa988c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sCGn9XAE_lF3poFM8OEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060085
X-Rspamd-Queue-Id: 365BF21D950
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95739-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 7:21 PM, Akhil P Oommen wrote:
> To disable l2/l3 swizzling in A8x, set the respective bits in both
> GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
> for Glymur where it is recommended to keep l2/l3 swizzling disabled.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

