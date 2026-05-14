Return-Path: <linux-arm-msm+bounces-107551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJiWGraUBWpLYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:24:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C58A953FBB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEBC93014974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDAF2E1C4E;
	Thu, 14 May 2026 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIDd61Vs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dz4MRTcm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94B399019
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750626; cv=none; b=W/z0BuBNLyaTYDnamXSkJdGkHMPAE3QnxL8cko49OXiRZxKSZLaK0zol19+iFnOqWN2yX2BUw3+DCWF2SGWY8Vq1NNE3rekqL7q3Tb3cNN6oa8NPqax6TIP5FSlifV1gvj+20nv3NgaVkR30PQCwXWyTWf+WmxS7LXOIK5nGf/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750626; c=relaxed/simple;
	bh=D+0UR+tuvuV+iGfThn6DdO0atxo4c51hBLb9B9cq4+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rY/lh69L5Ds4DNMFq7w5VOmcumFMe6nF7ZeuGMRqXncqzriXc1ygBOANDGLOSNhnt4IFc5cn+lLGmvISJCgrxj2o3dTqOK4do+IZ3atBPxfiNrzJfgsPoLmr+zuQrYIzD8EWU3GZginPEvIZS2tpFrla8EwJG2crSeNdfBo6pZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIDd61Vs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dz4MRTcm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E8YPLF1622258
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7mfb7Vpn1k0Bgb4UZHW0W0XQiV5frm6lZKL/dZelLY=; b=dIDd61VsmW15KdXy
	ruWqI5i4785aTYCsObwOPIZnr4VeMUPMgh2qD+fOvSuNKhW22+fyI93n1xS8oT3j
	hljoajyDUhFIJ69GIjsBa7GvYGgiEgxTgZh5fJRZWDzEipLnkclLtR9iUimhIFlH
	qn5HTK56s3S2jyWl4ystX8fYrSeUgeyJirpM1+iIHOhr+nstiFIx+vo4YJqDnrPS
	/wVKDgz6Q06Mq6JSCyXmrW4TXErseNTpNbkMBivkh8rXXVj1XdhR28NyUN7gJEiy
	sZPMP4HTlfd4ROl85FjJ4up8Egao757BPo0Gq4fYz1+ag+wMQsuWQ8+NDIA3dwkc
	/kWPmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492sgxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:23:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f6e66879eso56446785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750623; x=1779355423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7mfb7Vpn1k0Bgb4UZHW0W0XQiV5frm6lZKL/dZelLY=;
        b=dz4MRTcmyWq6urB0W3bJ6TomXomCdp7EB7Gninsk48Q7ZuseTnlCqUt1NUuCWAIJSr
         XmjSg3e/gbiAzIiABdOF9a/TQZpOcLPut+GTK9lqIZHk6E9f77JdozgBXUSxO9JFx2WI
         wDHTdtxOuDGo3nzdIyJ6NCpNWMA2SLxJtkOrGNpuEKKvCvjZRHxE6fc8wmt0+mOmp2Kf
         f9m7Yr7P3E1xihCVyEWDF2RPP1MEkjoF0LukjVuM3Lkf1aM4ZZAnu9LhCE/LDjDreQOM
         aOTIpFY1DG2uGNsTzk1s2XfYpWBb02Apuh/X02OSjjK3oKiLw1OAwxGmbAM3bSU642dZ
         twnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750623; x=1779355423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7mfb7Vpn1k0Bgb4UZHW0W0XQiV5frm6lZKL/dZelLY=;
        b=pjgXc3RYdjFYdHXt/Pp42dQ1mZuv9z/N5zJHfRfpgCNBgTZCMH5Z2pRudIbMFBhT/B
         ClZHLTjoPmoLfQjB6ORCiZVhSBp2HiGIOjnDLrPAkxQfRCP28Kwz8sk2dvA4zOXtPAeT
         8HFuBh1ijBWrpL91MeO1rRDlFvKOH+kdz8lZ4c26ZlbYM2UDJOFOU3mz41/neLPNc6p1
         yK9h34rTDfEQHtTehPeWTb44ARwh+bU+9Ug66zDDYiVgEv4kW2Z+VX5PBV/RbYQkp52c
         VpSO6Zw5j98mpdVDnIZyvxJPNW6cE3YRdP+t0jNRSpRmomvh7s9tCugRdQaCaiaNSNne
         2gXg==
X-Forwarded-Encrypted: i=1; AFNElJ91nIISewdMABsZDOCDbaiPnp79b2fzAHiyZhVMPVvtL9yQ3YwT2SKW3jD33P1+nV6IhuuO8qkaeqWyIoSx@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFFiHVFn1qifPjVg1aRTWY6t7I81C2eRZICAw9ZAuzzHw4KgO
	LMZePNGwgsze89QXQHfNBlEnNAihZytsluIN99orFYJTv0IQGNA6FKNFUCNWrS4z5uhyq+yXDaW
	dfPnYtzIqVFOOizsfdnq2wn3vRpccvnfoaap85c4UedzXs/5a2boVWMv2xxHBf7xTOPwV
X-Gm-Gg: Acq92OEu8EuPjHVY795igRyMonLgdo01s10ESCcr8lsO0bnp3eyaKKKoWUM+oiczRMX
	5+K049SbJVqQkQteutv/rIQB70gpi2ViJ4b2AWR/Pwmkz7UDtW9v2XFhl8BrDoPY4G22Sqf1KqR
	sGMU71t+VxByOEZsmUQjmU5KjHVqo8wOhZf7T1lowxXWAKmI/1Fe0jvMIEc7ww1+e1Gd4LDB5qQ
	BvezetdmdgNVLsZzhyQeQqAIKAMoSG9fU+ZuByGjl99x74tRik3nyWg76M4B+Naa43MDJpIw81/
	EBn6ihHm6zz4AB/QNy6CQAd06Zl2miH9pmGlyYGOG6l+ESZNwR2vLcrvgzZZB03ISJlqCKAHVci
	vVKun9W9WW5VLpdVPJXx8/q0IF7sE30LwercGUoLf0NVSXJ+y106W1nARNUgF7Kta252AmT4cwp
	Tk2Bo=
X-Received: by 2002:a05:620a:4043:b0:8cf:d953:b4ec with SMTP id af79cd13be357-90f8a634f71mr758713885a.3.1778750623337;
        Thu, 14 May 2026 02:23:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4043:b0:8cf:d953:b4ec with SMTP id af79cd13be357-90f8a634f71mr758710285a.3.1778750622815;
        Thu, 14 May 2026 02:23:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f76sm513638a12.19.2026.05.14.02.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 02:23:41 -0700 (PDT)
Message-ID: <d2025522-ac5c-4e45-8274-1cbb49b7b348@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:23:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
 <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
 <ezpigr442rjnodqcg5fqsyaik3tkp4yyw3cbu6j75ra2vidnnj@7svqkcz45sdi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ezpigr442rjnodqcg5fqsyaik3tkp4yyw3cbu6j75ra2vidnnj@7svqkcz45sdi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5Uyrdsp_R9q1WbUyORR1ZI5vNlz31Rn0
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a05949f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tdAlGey_Py1J2zJlv2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5Uyrdsp_R9q1WbUyORR1ZI5vNlz31Rn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MiBTYWx0ZWRfX9K4rFGogRC84
 kEEiy0VQtqfWUFiXZwyc6/9HkNsK2rgz3OERnGl+fhlFtfMDDKgl2WJNqIjg2+LA3DYdU/iTy2p
 fFXxYG1+fk9L6m6BwOqygO6lTN02hIvjNDmjGKroGGXGP33ODR5jI/fpUdpueVmL4cdliB/JWCO
 UqGb+VgiZNfOYWpcIdiCi31ywGHJiwjhq5Vzf15J+crNdKfJCl5SEobAPKMIKQlSUog4M+lnwNZ
 pbf23U1/MA1mACWzl35gZGMC8WDGXTffih4+YQg9d91x9i8mnFcgxVkscGYKqy7RtemzUNDbLHR
 o+hixv4XSQSHW1bhGbrKMsNVTb6FfeYvFefoO4fEsVhnRlBid7wObe7/cY3VYE7A3/lRMj58PAZ
 RpcoM+ZPsjTFF9+Mcs3qRt1cu1rcTj7q204/uAukFhOLfhHNSOzkMI/oRvDJzSC7U1wUfMx3v+k
 4OrYjCVxEobz56OyLXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140092
X-Rspamd-Queue-Id: C58A953FBB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107551-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 11:16 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 02:15:12PM +0530, Rakesh Kota wrote:
>> On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
>>> On 4/29/26 4:09 PM, Rakesh Kota wrote:
>>>> Add RPM Power Domains support for the Shikra platform.
>>>>
>>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>>> ---
>>>>  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
>>>> index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
>>>> --- a/drivers/pmdomain/qcom/rpmpd.c
>>>> +++ b/drivers/pmdomain/qcom/rpmpd.c
>>>> @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
>>>>  	.max_state = RPM_SMD_LEVEL_TURBO,
>>>>  };
>>>>  
>>>> +static struct rpmpd *shikra_rpmpds[] = {
>>>> +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
>>>> +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
>>>> +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
>>>> +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
>>>> +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
>>>> +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
>>>> +};
>>>
>>> This is identical to sm6125_rpmpds. If you're sure the list is correct
>>> and complete (no LPI domains etc.), you can drop this patch, and proceed
>>> with just this change:
>>>
>> There is one difference — the max_state for Shikra is
>> RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 
> 
> It's handled in the DT. As such, programming model and the domain list
> looks the same and compatible.

Yes/no, this is an upper bound

one improvement we could still make to this patch is not to define
shikra_rpmpds[], but refer to the existing sm6125 one

Konrad

