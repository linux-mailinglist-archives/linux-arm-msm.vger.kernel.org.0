Return-Path: <linux-arm-msm+bounces-99450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL+KOGPKwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:18:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC982FED9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAC503021437
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461683845C6;
	Mon, 23 Mar 2026 23:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CT9FAQZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPdRLJUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59CB3845C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307936; cv=none; b=KWj6Pd/Zj3f+8TSalX/FGonr51Zw4liUxDlEhy25ww+freOu3XWrF1u6bCGWvYafyqE9lQTKspBYIVxGBc8kY9u+8IVI8jg08lqk3pCAcMs9wiuemO9XgK1ioOmwN/wBYehDIPyhPGxWo3txvQvHOW1aw9BSHJjgzT0T3BvKWZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307936; c=relaxed/simple;
	bh=s7FdqCRLbyVdCbVJjRXaLMwOx8FaaiM4Kt5nhaqVuKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+M8LmeWkkjjcFuKpeiHJWZoWUhIOdgvVMZk1C9rRUTVr3vNQ3QRzFe8xtWTzYDz9OkrM3F3QVCRHmgFB2Uxn0OeFnnl35r1h2N8eHpYZi0/iVSHs1GT6W3gIeGne020u1C9w7TpumyylOJ0ZAX/Gg49nDZUcqRDvTGBd7gZfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CT9FAQZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPdRLJUW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcWV3817779
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sjl9StSnNVxXOKcZexr+r+g5
	driviTgKFiIH46fyl6w=; b=CT9FAQZzxO1qmifj0yenu5fylaWbACPnsZuPY8++
	hORQAgy1EHLEFxYtX0b65vKfyh/H9JIfmqXxU7BBqw0uL8tfl0BG6CJxLhR9X7ly
	5EHPtEnD8OuZdS4gtgKy65BSlZOx1PI/wUnsIgFDaO0Wf4D9nGPeLhWqXVpgkgij
	VzqO2KCuPxgXb+Hxt+0gjehWX7CCJ5sAFKsrsMzpYM7WyvKTkLPCW6SlCVtTVU7F
	+9jNXawY3UJ+NUn+L/WtegNCCn5zFiPfe21badCoIsrib8qavHPQe05KGdZpzaG6
	47hzvmJw/lgOS4l+ftNlvLy0VcIgAm1QJ9w6JojW8xMY9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w26dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:18:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b5f675be9so135634271cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307933; x=1774912733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sjl9StSnNVxXOKcZexr+r+g5driviTgKFiIH46fyl6w=;
        b=bPdRLJUWpI0IM8eP6xMwbnkp7P69lR62stdXemugbZJr0CMpfEjlAMaZJVUUe9/5AN
         Mf6tQu+odBidBq18a/zyEouih2GCgz/GL5p22462y6YTQauZ3rQisM4m6iOEeTZ/M6UB
         SR7roS8qZhVaOGSWTe+CinYhXRb9oBhsJLbohHs1hWl+3bUvIjlCM5CpBNQzoeRjOudT
         +0hlNaSEnEAMiP7TRgJwCB3YYI/iI3ICUgB93DZVY2PPGL0rK30Brn4J9LMEsRmHD1Gk
         52FqPaHk71d5iVSMdgEme6eYTmYDPzU4BBDEohAj4x0CPvQjrcvRJkXwDD1IeZotnTTs
         neJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307933; x=1774912733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjl9StSnNVxXOKcZexr+r+g5driviTgKFiIH46fyl6w=;
        b=QcClBSj50K2sYWf5w1XBNWxcKswPtTwffbeGQCCvmEtmRklXJSUxL23uEw4RbzE2AP
         pwipP3hgQh3q15e0zqhgq1PP1e6vyjlAz1FnDvmivttBWGdJYB6X9jeO/kvQ7INiUr59
         fqT1kpyRUOEU1+mk7h2NzZHiSQKGQvuwiD5D2qh6X4lhYjmxp6xik+j95qKPkvoFlnUg
         eDyRG4+sklOOvCaYDXsN0S3Em4BogiWl+W4fJauqmga4MsRynWs1GcUnfL188mAsuJGL
         dGdyZF2VhRT0dGHNobYpce/HWem4EtEe31Sv9j05qZsAz8OvncoNSZWHK6pYBdJ3cJit
         icTw==
X-Forwarded-Encrypted: i=1; AJvYcCUw2crBbdOPnvnieuUpceH6Wqw6yWteCxq8PpBsphIr1VWqeyDdt9k5/Xz7w2nDvbrgVaBnP2nZqoio2rrW@vger.kernel.org
X-Gm-Message-State: AOJu0YzKmlJJrV4gXC4Trf4Va1hzcwDEQaELRfoNWOkCBKpDDZ53hJB2
	sfjg4sDZyWGZrsSDtc4nOj8QdGjiN2bsC/VnoDK8RFCC3R7JrEE2JZeU1e6wmers7MwibeK+aDk
	W+ecATASK5qpQ1HmAgsUzW1UOndXDCTvH9M87bn0rUNFWTbZFlPHy7Xw1f+xgHN+d4h5r
X-Gm-Gg: ATEYQzwQGB8cUH6ODRXYWLuyVVBpC9CxHGo+rANWrCoJEuPl6ePcQ87CzUVBzn/822L
	ikAYmelz88wp9/hYkHA9r4If+Djzr5XPSala2oo6NWgJuIuJueqqOphLjNrK8hE7pOHqAOHOo1L
	uktUS+WkQsjp8hD84qRb7Ua313WobOGwWTrdbj0pAmOlB+8xYTo8pwsmL8RmrRj/K/eTbK5918t
	T/Mk74S1oq4U7T51bh4FYvXY9elO+YV0mH3PNCet8gEjBR0glO5xGik9MX/C+knUkoSYn5UZ9eQ
	Ycnu8faY5DhCkaIChpzP98IAldqviN3u/ipi1gjjtTieyCgQ5gjgoJOoj0df0RJL6qKkVW3FYMI
	CxVYA3aZOsmYNqAQYGF9k6U14FWKmI8IoejyTyRsoyslljyIEZrbiBB6E7BL8ntPChqlBR6zWCc
	tkSeamoR12Mv85DRl6MnDNtG79Ga2dTcN4Too=
X-Received: by 2002:a05:622a:1f8a:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-50b4b2f1a25mr126362451cf.15.1774307932873;
        Mon, 23 Mar 2026 16:18:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8a:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-50b4b2f1a25mr126362201cf.15.1774307932393;
        Mon, 23 Mar 2026 16:18:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e31sm2792282e87.64.2026.03.23.16.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:18:51 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:18:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for Glymur
Message-ID: <a3giwrhoasjmnnpkdrxf3qu2nmm52foa2h7xwgtgnmvz2ouwhr@mgodi3ti5ozf>
References: <20260323230523.2209023-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323230523.2209023-1-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1ca5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=c6cw9ktTQjVCT2Nc_1YA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6JLGsbTiItapFvHVpVBD9b3-P-qO_Ro7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MiBTYWx0ZWRfX6I6pp9sS4m0K
 vzTHmgvzEn9308f1PayYlRIxnagSXG0FXeuxSIXRQZ09ucCPqNcr5MntGpXGv4CgdL6hinoHQR7
 OF9b8XXdPTazKu/qdo3Ql1GA91wJUcBmZzSZdOC5/J5kouLdyI9/cVr4Lat0QyTWkfnkDer5cZS
 NjsdwUvWyOCL/8B6NT5FfiNIlMLzkT2lT6DwbeFl7yld5lNFhMIzqDVtCdvtB4iY5d6Rr7/Q+mb
 RgtOE483WJVkAWZFlNpP0fdxCZ2/Y2bTa2QRSkfzDyYF+oY1NrKYz5Mq1e3Pf1Rm1GMOTP6pPbI
 TcCoBjhOBAjQ9WkQmxUpGTnfXism/SzeO6QMQo1SE4R/bkiVofBgdPChOFADq2x3FpZMuq3oDG3
 gi3YGzKS7n56QDSqqFIguk4ai5Qa1yX8PTqLV3/cr4dOttzfAlVTDv04/UmzuRhJn6TuFEu76gv
 WvJxkb5PvrHqDJ281Pw==
X-Proofpoint-GUID: 6JLGsbTiItapFvHVpVBD9b3-P-qO_Ro7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230172
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99450-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FC982FED9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:05:23PM +0000, Srinivas Kandagatla wrote:
> Add Protection Domains for Qualcomm Glymur SoC which has both ADSP and
> CDSP.
> 
> Adding this entry to the kernel driver will avoid the need for userspace
> to provide this service.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> +	{ .compatible = "qcom,glymur", .data = glymur_domains, },

Please add an entry for qcom,mahua too. 

Other than that LGTM.

>  	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
>  	{ .compatible = "qcom,milos", .data = sm8550_domains, },
>  	{ .compatible = "qcom,msm8226", .data = NULL, },
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

