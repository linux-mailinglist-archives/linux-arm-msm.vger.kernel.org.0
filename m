Return-Path: <linux-arm-msm+bounces-101816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mo4HCaH0WlqKwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:48:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9C39CA42
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 297003004D16
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054313254B0;
	Sat,  4 Apr 2026 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9gfYadd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQfReWEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB00137750
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339295; cv=none; b=jdl0Gqwtk/drlAdGWS8MsBVivNksgSyeHerNNSjXTx+wEdbuO3mlwXbrLpLcZXl7hOvcysWJ4N1m5CdKsBF9Zet3YcHaFihUYvAe9ByvU+GeiPCBkaudt0AG/4CKfPSPs1x7fNQPhB+aUkMFTgH+2s6LVuK9xGGYP4sAhyou8XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339295; c=relaxed/simple;
	bh=R5MFZn7on1y6XbobayspmKaqSBa/YVcbEAuZzGT4MjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WH0XWw3JoLMqIEb/2hceOB/bw6KxUs25SNWmNEB0QXTcgkfy3Jh/kJf8Ubb46roINMrJRJEkelK3BjDX0Fe4U24x8W+mge3HqmK9z1/ub0L0ZtNdlZ1cSJmKHGyFqbzl/mYAZDfoUsk/McsxRDjwiqX+LsiAln55H352qLe1Vzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9gfYadd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQfReWEm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342Bx9Q4114558
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tfdwPZDSDeozlLQiB/sIpQb6
	Uwmc5WQ9+LfB1oCVSs8=; b=e9gfYadd/zBkqWiDV99vJ+ePfiDxYXw2wWA4jPP8
	U1lJBTclnvhMopIC7Vj0CLFiwi2r8dqV2cFaXND2CDeP1zPq8PbrxMtoG7uzHtx5
	oMtUwebtKsnOLWbA1jJjsqBUrQxpzPGktTnNNsu8+7fY8+9HWRD8mqXC1POicTIu
	OFWyLLbnFAwgKuUcMoklN/FZP3QQ+NxTak3D4adTp3ygmtWbdjva4pSlJ5X6S4KE
	KDmW38WLcj1bMI2MXxy/1SbCH9NQXzHzkBzf47fP1bqkbgUyVY3nXiHuGlHhUTA/
	9tCPcKpmqg60oV9WoWsPikE+VQngRBWeyE/TepXGq7Lhgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5snms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:48:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d58bed44aso88248691cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339292; x=1775944092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tfdwPZDSDeozlLQiB/sIpQb6Uwmc5WQ9+LfB1oCVSs8=;
        b=AQfReWEmQwwW2Dg+Cs0IPOJuVQV33g/vgYdnZce09+2RMauaMQza4afJiTLRQABT+l
         qdEFmv4zVV3Ga+RKjC4xjGAN2xDhPRFywqehAgKppIHGWh9DUHb4dcb5lIn8HFY5tz8C
         o5JGhCzKzdRYFD9FnpMTKpO/lp9O2H/yPQmbHCJSxXXPWllE7HxaO0PXvK2d+F5zz4kD
         d0ZNXRqPEGLKK0CTY7U2Ju5e5fNfRhLYNGEpCd380V5B+v6SZkEeP2l+dUt3Yxhoq6uJ
         qo3On35bKpLXPBwxxSdV2N6qHcpq0r+dZ2I2A2ubVNDrNEd6+CP3FwxppGGixWCL4ZhB
         v4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339292; x=1775944092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfdwPZDSDeozlLQiB/sIpQb6Uwmc5WQ9+LfB1oCVSs8=;
        b=DZHDvFM8u2Hv7O+J72jTU4v9f1L4U0BYH6kcx/n/9XHwe2eyGk2VcysAywmyBrE9ij
         SGt4b0I6+TJWLxqCCcj2nfWNOBrPRYYXL+ssk8+g6PGLQmQoRyp+8dgRvcgBU7lFC+UR
         pA8ykuVv8gIu/CSBXlYmkkTF0PvC4BuyinxGf5mvEuVDSEnEpxJtFWS6ChXIlWx4cuTc
         pMLdKkkaOgNhdC4Voeg1PRORKKGtbKoanCVTzP2fWJQn7I/gXpX6oJ1DsnrNe3r1fGSu
         4sm9wFtxUgB/4eszhUwVfFQfkupjp0AchMjiHbzw/+fE+/E7pULCblF1LiKRNQCMrhrO
         LEiw==
X-Forwarded-Encrypted: i=1; AJvYcCWuNXph/ljEtLkQu5kkDnimS4lFtGxcSZGuU1Tj8JrZHJXmtZ7aq9yzuv+G/FIfvrRax2YmDv+h1FFowI/k@vger.kernel.org
X-Gm-Message-State: AOJu0YzC5g87miK5nMMKwEMCIAT2/Pe0C3aFXhpsf6uUY55NOZMQG09v
	/mE+U8VV/0yG6BjeXB0a5bVKWdmsbCojDhK4a9ePTCbhA0TbBoEQSb1Z/QUyYo+B88iUiT2eVmY
	nR8JkmPsESaXgB+U4MEeKPMN+y47hFSiVoIMGJV9JbRj2wevsiwFSVCVGhNO19GWhOXn0
X-Gm-Gg: AeBDieuqepQl/MGMzn4yllk2Fiie1s+2dFXyCrPlFusBJUsWQ3eY28guUqtqvGAQdxp
	IMb94fklTN6m/agcA7wtXtiddoSlQg0WJhBaWtArJDwuRa+CACvMx+0tW+BCFAb5+lJFKW66BWv
	E0kWi5qW8Osr7QwUvY8pHgAVbDv5ZVEtalv1Gean8nVgG/4dNRWF8c5lCbEWAx/saZ5oPwlI5pB
	242yjfEYJxI2pXlickformZfpYLBmvFyQcu6Q+hgKRFDngK+J/n1DT5wfiDgm+sEHosqL8XpRMc
	BTpgww2/gl3hR41cyohG6httmg8NbBGiyzaxGgvqlIgjBvEXGMWUB7Rj/73770Of7xUxaBI6id2
	dHDPP7svE9sWusRlRd/EY99QUXQCLQUzd+zmrpj0EkcP55V1xX4i+Gx0DnWuRb+4m3O6D9o4o9e
	texNgg07YBM1kU98/Wh/vKwWHgCRCMwChqtR8=
X-Received: by 2002:a05:622a:4889:b0:50d:7135:5631 with SMTP id d75a77b69052e-50d713559b5mr73311651cf.6.1775339292385;
        Sat, 04 Apr 2026 14:48:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4889:b0:50d:7135:5631 with SMTP id d75a77b69052e-50d713559b5mr73311501cf.6.1775339291911;
        Sat, 04 Apr 2026 14:48:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc96fsm2308220e87.59.2026.04.04.14.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:48:10 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:48:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add power domains for
 Hawi SoC
Message-ID: <q7nzvopy3mz3o4fnyg7lspaim7ccf7vlj3xlsaaiq57dzvyoiw@xz5yzbjn5suy>
References: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
 <20260402-haw-rpmhpd-v2-2-2bce0767f2ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-haw-rpmhpd-v2-2-2bce0767f2ca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwOCBTYWx0ZWRfX1871cS8QWlLS
 py9BpFhlkc/+/6llC8zk9pOxFUO5f0k3fYMj6089H6xNcJjHcEmZ+zwLq/OO6wDJ61y45vWGPoC
 mEkFw1cnT0G4kiZmSmlVa48hhxeqRrECkVQ1Ep2OOPlMpgiznWmShjAmUNSnT0uhs8gDsTK5fW7
 xiYGgNhxzutH66dO+1kx7bOk2XzgIOdVE5JdNHM3rYMd/Ez97LFuz3xmdNGannx9xmkidrZRf4o
 2uKKYjawe2UgKQOO9RSFdkilk1upMCUsq2gtJENbYSMaMeLT/NoDQ9kx/5hFCrBa09OFzso5jHY
 igEF/QyJOONV4ROQp1HhnM371HAEISyUML1/gruBZaBBhLH+bcgHiDikVcYF/hXuU8IOwU2Onrv
 3HkeQp+SmJbPdPfQ9gW3hD5soKNCYwLOOZs2H0zYZBst0PojhJjuyS8ZLdoT42h/pUWf2jN5bXO
 FW30+ANRAJtmpcJayGA==
X-Proofpoint-ORIG-GUID: ypmodFWaEV-taE2DOuEZ5Oa9_d006CF_
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d1871c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qZ5ZlOtsQYTu7SIoqgkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ypmodFWaEV-taE2DOuEZ5Oa9_d006CF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040208
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101816-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 5EB9C39CA42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 05:35:22PM -0700, Fenglin Wu wrote:
> Add the RPMh power domains required for the Hawi SoC. This includes
> new definitions for domains supplying specific hardware components:
> - DCX: supplies VDD_DISP
> - GBX: supplies VDD_GFX_BX
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

