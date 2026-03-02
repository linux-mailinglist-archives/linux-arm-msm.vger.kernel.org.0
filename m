Return-Path: <linux-arm-msm+bounces-94912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMpWBa2GpWkeDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:46:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B081D8FD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C79D23041D65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF269373BFE;
	Mon,  2 Mar 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zjf409ld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Px7JRSv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847C936F41A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455146; cv=none; b=coW55wjvCsSWko9h9+Po5aUnXwAjqecyHIFUxOHuG659TmpFQoiMYUVGBJ0ANveTXmOJ2jYEbdS7jCefzwaToqEv6MtrILOB8T82DKeG3AwKNkaXYavz60h4MPohxKvlQdkB2jj0BtQDUKmauKK11EhAk/IdbsFfd2wMdVXuIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455146; c=relaxed/simple;
	bh=k9eaVQS4Hx5S32QgSgDzWl1DwzdcmuKjVdvsxRq7U78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6FyF+yKRAECz6qk7Can+SUJTATZ9zX3JDiXsxXEu8xB/pULDHIlp4QePn0dBWSK26IEcO9GJjojfM3AEC2LJ2HFfJD5pxT55t3yilhWE7A+UBezWFubuw9eDtziTtr8eYf09O06wiQvmaIvMTM4DFIfWpVg+yvOwKIjxTZyZ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zjf409ld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Px7JRSv1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EmOV3630787
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=; b=Zjf409ldqsN5tiwF
	foHlYNVcL7NHrdBHqoaIT9TslddQSfOcc6B7qiuOXq4pN3E7WPBgW7M9WWei38z/
	7KCJWrmlkL99t9K59J6GmvDwc3qZjRM86XOy9+PVtDS2tdvMsDXM4VHFTb9fIQJx
	GISpnaGJyYrLzY2qfKlrk+wYLCdnJaiosP6sWDbrrUe+FiJRAhofImR521QxTnua
	jyB88tzboBDyLFeo5FaxFnR4g+NaXrNeYthNnETTKk1oi3d0/bZeOAZ1MYDxy1fc
	hagtWeRCqK4CyM95baWvLNgE/vXFl+AcSGMRdzFhhxnEy66OwKofbnfSxaBZOMpR
	5ErYlQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrnh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:39:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so414893185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455143; x=1773059943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=;
        b=Px7JRSv1MNd4IcdyeuBDI0dF8Bypqtw41wdczwloE+J+AKMGZVORZbcslfWMAGvQUs
         ZaYbcy67KHypoL41AkekJDA71NIADjZfrOI1rB7ORSRAHiNR7fmM5jfKfIONhKp4fqvc
         a6rVnxui2uVJoLzyOHv2QwFGTfXxz+Z5Rcjxjh8tcn+xW9IAnKSD1fkwjljhNwdQ/zDt
         8MH0kti+LBtBiuJuq+MkNUebwN1rVvs7eex9JOXgS04lpi5quUD3EKEJJcS5tI3YZQsY
         v3x1j8DgFnxhoefWiuhsMbvUmzAR1Jnw0L3jpjK1PEJ6SR0dUsqOE6o9oG8mxET4rdDk
         Xbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455143; x=1773059943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=;
        b=DudkUFRpTfrzIsJymel39/boj4901O1oqYBVYQ8YpVcD2DzwJ4956EIGFJGrIHqnJU
         QlIjM4WYDgK2LinCi7byDNk4mmHDj0GWHYUdizxrnl2OFitHDX2wL2c2oR9SxQiZ7aen
         tNTSKSOlYvLQo3/QNfi01COwFu3bXZ7ngkIVGb5TipyJP7eNELYwEKVNFXwrKD2qc9U1
         N21YdD3qpb38hXxbQFAxezic/dfUGl8ylBUlTfqTdFze7jL2EDlt8tJNTQfzWm4q+wDE
         c20R2jLHdoLhODjSzdBGcvZ+nS5JlOrj305mGAcO5iVBiLlgkS2YVuPaplpKUPACT80p
         j/GA==
X-Gm-Message-State: AOJu0YwYeYpnJxyIF80qPSk1SHlm+GJq7K21TDP5R7C9991nRqBsl+go
	ot9cvp9dJY/0An2AVH8cj61uMpTcPRIDgKRdyj4JLj1r5iIc96vWHciWIVw/7B1U5T4O5exOaF6
	ttLWNM0hOuCKCIwtUtvrpPWfBU45lMM90065hwLd0SYt+wAw7cpitP0rcaE1AFGtZTlqW
X-Gm-Gg: ATEYQzzHR4Jk9ia0PmwoWzG6pHxgk5WwQWq9p0iWbMtiT+H142KtaIrwzakrnmy1v+R
	mUv7GDlbIiZ3GXRt/wJQt6hrwsm+ZwyNPU5XWYRhMVNRrv/TNi6Nl3U/9VG3HR1Aj4v98g5EvA1
	QntOXK/RgX9oPVSc9rBvIB/KqGwyMaCrrQhzPuA+d0UEi0JIwUtUbtL0hXz1N2B/fDSriEy4M16
	9L6Yi/SNfXwdC/2UWr4jnzy9EQvRkyZwd53F6Pu7AthXYh17TzrYatEvFGcmdiKZJCVeQP8Eb2J
	kZ/WBpGnH+SrfdmEmxmpAKflHF4p4nJcdjS8Q02FhX/w2CwPD7ueictpZtAtSAp1tDxX9G0mIyX
	J5PuZQulB+2H6OHYcknL9bh20NWyewsBgXxRR5BgUSE70Yv9ilvoYoI4OMkvekAXaQsFbkWtu+U
	TjUZE=
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cbc8dd163emr1221192385a.3.1772455142932;
        Mon, 02 Mar 2026 04:39:02 -0800 (PST)
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cbc8dd163emr1221189085a.3.1772455142347;
        Mon, 02 Mar 2026 04:39:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae613ddsm465043166b.33.2026.03.02.04.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:39:01 -0800 (PST)
Message-ID: <136fb7f5-6574-475a-b30f-e5770abfd51a@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:38:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm/dpu: stop declaring VBIFs as an array in
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-2-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-2-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P0xT_X9smtb_qE-K4Jh-2nQgTczHQH8a
X-Proofpoint-GUID: P0xT_X9smtb_qE-K4Jh-2nQgTczHQH8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX4v3DkdxCTzLX
 lR7YuTHB6jRQGN/VLWfBrc4Jyb8R07A0qbHOX577Exn5IT+4tKUWCdd7IZYXdtVreHcNrj8AjDT
 RkHQ9bJ21dmIHZBLszqxzGIp8XvbZQVP5EUxhj2gV1qMlQ2vaHL69MknYWmW0ZqBgEFk4ZLY7co
 PPUC5VQ3g/lKvnIYpdf6xCopnTPu2JfOl0vzWgUkHL/igZ35pw6Q+sTmQorrYF7DZdJWIJN2hrj
 JIeMaxK+8FsLXiL6JtDp9Y6ddbd8S/Hv7bzuYVlMnbQOqekoCtjGEf69AtfxJ/pV/uWDvtj1IC3
 KMfqbchldWvA2PE3uSL9Ed1kZz0qMgPlq0+DQk7asQWFc50O0bFdtpDqANuPSQD8ElerTA9BHvH
 s9BxOyfJzmG4L+T4X8mZxVya/n9dIERKDVEVX/sbuiuA+Y3JIItx5LYjvZJ6LkV76JvUeBjQLem
 A0L0b88pwkwRQokSkfg==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a584e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xtCnSr9B5oVFkYUcn1YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99B081D8FD0
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> The driver handles a single VBIF instance, VBIF_RT. Stop declaring VBIFs
> as an array in the DPU hardware catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

