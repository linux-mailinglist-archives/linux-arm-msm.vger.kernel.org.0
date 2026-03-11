Return-Path: <linux-arm-msm+bounces-97003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN6FKdJvsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:36:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35331264A59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7A15300144B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B27218AD4;
	Wed, 11 Mar 2026 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMZTCGQl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqfTJOnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98276282F25
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236176; cv=none; b=WkHqHQYHDTVubmJ+WJztKjceaaTNZFV2WZOnRypSS3oPPMb1SOXDX09Qu3k6Y1TYfu72Ty1D0mQnSTh590jSz8OcE1yn2BHA7V5I3l6xtpzqh31oRHdn3zrZ6tH6Z+xiGchbCFfc5IvH4ARdnWvfJUtCj+V8awX5gp5r1WYewyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236176; c=relaxed/simple;
	bh=rH5ts24BQ/UhBGGhX49B8Xlk4TgPkmgCrBdXZkBKpwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkYr3+CkQZE/0rLU7PqU/0s5tE8adbslpgoKFbowFyjUgPgUdUCKMPiNolo6ki9OTbZXOBARqAROjZ0zw7sCoT9xUq4y/d1OEsNalF3P3d13feLTkp3KKeYdvqZfwO69G5ruogowG7OB+A3rFJnpsEF6ufqVu3RleJyh5ZqQJfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMZTCGQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqfTJOnQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCqEai2030858
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykOfdb/L2I81AJssik4ZwdY6lbmVgNW0kf57btl/s/M=; b=GMZTCGQlBkvsgqCo
	o8yeUOIFiW8eKDJKssSiH1woKTKYhkMcY0veLW0sR97oqKDNcNEmkLzPoftvIWrT
	/RV64yTGYi086ah8Euwh0Z2D3Rf6ekgRzhutp9DKXVDI5c/HtZS9tMkDjcJrVFgF
	d7B1pRdJZo0tSW0U2YkSkB6RBNM0cYx+93/rWPgWatZaKzXIKNJFsk0qosurYJM1
	h9L+mzSKTRDqrUjttp8I6+tPnUJE9twFK3Z0ujvMiUs5TKTofImvsKphDfNxCYJp
	LC1agcaBGHKvMvYdtH57oq/ITqLbMtOowRlAS0s6fwMhgSiMkU2byjNKP7+/0cY2
	zbadJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h1bnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:36:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd93c91075so137435185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773236174; x=1773840974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykOfdb/L2I81AJssik4ZwdY6lbmVgNW0kf57btl/s/M=;
        b=XqfTJOnQ8vg9NsAUBCId3v/sxBVa+Gtegkks+FvVJreHgqTmYOuiUHGAuTNBh8bLra
         otzyXt1sCxiEN1/E9j6qTPptEOxg/NqMEzgSYedM6Axn8WI1thxt9fqSJ/kHXEJZGhg3
         2H7F8hGc7qDOFYF+DM4Fn00HRDKh94iWTERmCoXPA2l2V2RSnuDV96s3+BjW+ev1T37y
         IBrwIubhcFUROfkKdvXWLOb71DkVPOWdY4Oyb2w09aUuP3q1ZqqisUjXaXj53ohDbV84
         Q0ulxkKFXVpIzOdJM0T5XwBXcB1qK4j4fA7euF87e6QwWCGc+kmO/rNC9AYBbncnFASb
         GFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236174; x=1773840974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykOfdb/L2I81AJssik4ZwdY6lbmVgNW0kf57btl/s/M=;
        b=r7cg/6X2sps6/3o4kah4R5TllBHHFx8Noc4UMEE2OOmq19jh2pOQ9GOZk72014y4Pu
         LCIPMmBTSvGvTNMC9zJu+edsyb7+SPM9XE3CNSI3nOigr/dDqxYtwX9Cx0iCgEhu82UK
         bzTNAtwAsA5SXWgpXAVTl1Vo38qiBFXAeFDrSEeag0DbrskJxr61GjYh3Y9mjhTs4kKG
         aMS7WVtAUa5AsEKokhbtB+zDuzflYhhPmjW0kSs3pWejVJzKSY7r/9kWwuuCfhPncd+g
         IBtRkMQLt+6kHRlqwk3zaPNJStb8v+IfH+FJnm1Ja8QsL2ltWtzylGjgVcGgMp/NOuNg
         XwKg==
X-Forwarded-Encrypted: i=1; AJvYcCWISbBAAM+y7nrXYns3YMzD9JkHfHVx+ig+zGQ2xxxrgBVqQ6k8MSTXMSSa3xTh2NAaWaQIG60kC+oeDYlb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26ITI+7CdD/1ycBCSBBRHQs7pBhQMDraZlFaJ3CNTTvlaeJFU
	gJ60foq2luofPknWB04hnt4CiePDn2SrbhXFqCiX5wS3fsgsrormOuW6rtkyQYODRNGBFnO8T56
	bPkeDb0M0ADfzSBkVNSr/+vSFSV++v7wdP+fVB/U93i3NJgGwC6gQCar6kolDOVJ8mpWV
X-Gm-Gg: ATEYQzwDb5URNjoIKvizk/sNJ9LMBS4v4ubiAcadST27/i9HAova4kQUzOnh0+rfrU9
	KUpKmQpmLDgn0zn0tjUggUriwQtliHlBtmqcyAc5zVIRahMP6oHQ6zXWIl6sRzvNMBwRXAZMiBh
	84MqWSCERFUvqq8OuipwkpopseHmQGYAjwV8/3bYSJrInOjUHGI95ahGAwuKmnNOyY9v9bJ3Evx
	yGP8ubloJxlrFgiwtApF6AlbszE+8tKJw18uzhzS0H9j0Zd8TqdajgaGj4sA3F8RF7m5dYaSi/G
	TF+YB6WjA6aEBlc4vUdhx2siw8AQj9RnWtK0vJ684Vj/3hOVYd73vMUklUGE+10uKjCwwXdJ5zr
	9A7Polb0wkIjEPjaMLSn4GR/P3+yQFkNqoaYJ5j0BfRKYKknz0KKgZbDDQMkPwzRIYuklAURvnd
	4MjoM=
X-Received: by 2002:a05:620a:28ca:b0:8cd:9446:cee9 with SMTP id af79cd13be357-8cda1a7af37mr220998285a.10.1773236173987;
        Wed, 11 Mar 2026 06:36:13 -0700 (PDT)
X-Received: by 2002:a05:620a:28ca:b0:8cd:9446:cee9 with SMTP id af79cd13be357-8cda1a7af37mr220993085a.10.1773236173453;
        Wed, 11 Mar 2026 06:36:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de80974sm55622766b.24.2026.03.11.06.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:36:12 -0700 (PDT)
Message-ID: <17648d10-386c-4d8b-a135-f3358a677ef8@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:36:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/13] i2c: qcom-geni: Store of_device_id data in
 driver private struct
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <20260227061544.1785978-13-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227061544.1785978-13-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfX/Esc9ZCcAfPA
 GG6xLemY16ntoCmQJPINQcRTT576V5xSmVKr8zF82+JFpvNECHRqOyPYYbxamsav79WJHpjX4ps
 rkXFkClYmeQDVwyRUTgZI9+BiuDh34AwD+YkLqaSgWoKq3gebHo3n0QvGgqm34qPgvAVC9Iu2OO
 ChBnuoIAvA/YLSxFFMCm2F+iyOmjU2vfsVTpPvIyOrjtIJdMB7vff7knDGfHEI6fEftaoX19zNO
 6jCtbS258dNQbkJX7XJhWie78edTRK6rlw5H0AK50ECH0tHOh2Mp2PojalStrLmZYoytBPUHlax
 1IX50rF8jCwkwYFKxOD+bhCtKzWmtuRrrBFmyAdadO+Yb7xE+p+0Tkr8LxJJJz6qaHjHkC2YdcU
 p5TQ19Mk/hwinNACyvvJWyI39dFgq9aYUr2IftWN9OETsmxXmyFeaIad4hMwHEahqauPLg5HWGu
 twQ4vTR0EdRefi9DLPw==
X-Proofpoint-ORIG-GUID: s42mTBeU0cqMcxuASrpeaBQw7Va_byMd
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b16fce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LGq9mxx2219gQT2QHCcA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: s42mTBeU0cqMcxuASrpeaBQw7Va_byMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110114
X-Rspamd-Queue-Id: 35331264A59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-97003-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/27/26 7:15 AM, Praveen Talari wrote:
> To avoid repeatedly fetching and checking platform data across various
> functions, store the struct of_device_id data directly in the i2c
> private structure. This change enhances code maintainability and reduces
> redundancy.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

