Return-Path: <linux-arm-msm+bounces-116962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sorRHezfS2pybwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:03:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB3713A66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:03:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jbOsUwwh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="J/v5vTIQ";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116962-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116962-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE6323015D0B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C4C41DED7;
	Mon,  6 Jul 2026 16:56:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1F839B4BC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:56:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356980; cv=none; b=AHSa+BRmGOqxS37RiN60t7vC9wUjkoMNHWFSvWJ7vol3W5zxXiUMgK9v/SglUQQ5HXBJp4PEmooigstnW81pMes7eOUXBUO31LS+OJyE23KxsDo6L4M7bOGGlFQeSnFL5/monETX0uZ4lWd9mcrblObScUH7EpBcl288Bi9/vxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356980; c=relaxed/simple;
	bh=YPdQLfh2RGtydB69KJdhfCi19vfJppne01VG0Q+/MPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6cd29T+w5CY3go3DM7J6qRGoRS8CDb7lK198wJxAfDl7nJuL5Ukwkonw0snPLSCurtV9Bnx6mh7+5A+//qoLcV0DpPC7cZIbTMjRvEe+eEQHN2Tpb8LkSRkeK7R2lRBKuSLpgMlblOFCf+i/o5yBrvSnHACuLBo6htNx3ReY1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbOsUwwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/v5vTIQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7qV833022
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8gzFSFSvjnPKB6Lm3r8Nc/vR
	UdIbPEiJv8R7RlG9QqI=; b=jbOsUwwhsBRHzhjmNFd51T98T5IVCqZkBgZBVC/I
	0xEconIg6nzb43xHg/+eL63HJ4GCzTJTPsCw2+5Il+XwIVxrz0utZuZ40OBDZg91
	YrkUa+Qpf6lfbLM3WB8UMNSQtqBj3S7gIgnkrTl0IkRYoBBnS5KfylZLqOZsFfbc
	C/AuJZhtPfynXZmyuD2D3venbWNlpp3f91ZPwdmFBYLj4oqEJquLhHA/nob9hfv5
	oyL7/NlMThRGYgyorbnwcqgZxjIi/kB5oL2r+VppUkfwodmXTQwptUBoaitnyBF1
	Z4HplXhyZYQCzljJ/f262Omj8VGVyiKckGi3brfeLKYyQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98hvpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:56:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e73fc29bfso465775985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783356977; x=1783961777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gzFSFSvjnPKB6Lm3r8Nc/vRUdIbPEiJv8R7RlG9QqI=;
        b=J/v5vTIQmnpmxWspmEtGAPyW/LhxGJKffEINNx4hMMGvRHeux1jxYJmHVMgeCA+jL+
         v2VHZQG0wS7KM+OyHF0Et+TnoJ28vizRfszvuL7qttIKprb1Vr1pfjmZWEVISh66kuZt
         gJRIuxY5KkJRDLwKubUMWSVo8IEaDXyZToEPa5ZrYj70b87UGUK2EzqSgxdpDjTHyEHt
         EUnNKMK2rC2MRrc4WzCGQsQUWN4s8sg1FL/7ElMy8Cg3HW5H+cBoho1GUm6QmW759ZTM
         QrloWcEN6vcxvwUw4ISeuHtLEEERWdH7Qa4W5poyhA+YTV8i36fdyRlO2nJfMBsU9qgg
         fyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356977; x=1783961777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gzFSFSvjnPKB6Lm3r8Nc/vRUdIbPEiJv8R7RlG9QqI=;
        b=Ds8K7Dz81Igzbejgudgup2lKT8CTmHYykKfZNzzStG3RzZnuM5y1tw5AUXu1peZfjq
         /TiiJxDJQD1IMkiI+raK58vZDs0Xn+ovv8LphAoHfijOfU+zv1bTQDxwJOVxP1p4l8PP
         cBO8xla1LOjfsCx3dmA+8pw5MS/8yUSxjgBUzT96OivZAIXZjZkAcKYPbx4AdH6WUVLf
         R3RbfsxYGR7clI2YQzK7NlxRfovAW/c3HK6K0QbCm2ga7mwg4z7G0+SfctdZWSBp8OXb
         nz+VK/cKPU3fZhGWdCPz2463GSZmqkl2vt1C4QfZ45jWENowOYecoTDZa5EPZbhJ2U71
         7e/A==
X-Forwarded-Encrypted: i=1; AHgh+Rpx3jilejMaWybad+fGRIhySR6xYMtmj3mePPveWm4iSxTs0AjJHgPyVSQrJCAahFs+i6t32NWGnysKugGA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8rF9H57q3k0vDmSQREzMOl77TeITVguYl4nHyon+nb3A2KPEC
	6wC2/ilV3hiDPJjrPjKYPfzR1C5eIJkNUwSza3ypBh9BZ0SHxcE62CFRsyA7sgPHs902lWxw5Dq
	OJa5kXpJUK/GyM3nMTEDvVjuhmc+mG1A6DCgz9Qk+L9HcZBwsNS/pcRIP0EZhkhI7T/ks
X-Gm-Gg: AfdE7cnysaAX0TE+TLghbUzFQB0ddueNCroQW1Kj9TNL5FrXl7JuDw3U4NHmpoG8DoB
	u4O4KlAo4H5H/dHDN0lbMhHVTpd7Bb0sfVTDYY0dAl8x3N1EUvYSCIgCxjpCYRUOmqASycge9+P
	IkipfLykMIhFa/0xXL2Ek5bxoGoNx1w1BRYyj/kobUVaHzx9pvMNXFO0otT/f/h+C3fMMA3FTwH
	Ry0VprJS9N7sBj7+elNgVXrwjo7zuRlp1sDz5QpSz1b/n2tJgmWhpCE1MlCMUeIIq2mtk7vulYb
	zkWJb8T7CEVL3OZAofSq6iTr72VUv0/0YPq+aIzBkMuUApGDq96gWu9IgEg3rPwWVa4NYoKfxdY
	NmY8aggGmH2FdBrRxKl4Mvc6XRrmCPWuNqXcNSlMA1lhpBeYtEsIdvBlkkfJmIeVJ5FAh4QrkoE
	MoqSG6qGnx7hrkdo4okOGbfAOx
X-Received: by 2002:a05:620a:470a:b0:914:cb07:447e with SMTP id af79cd13be357-92ebb4b43b5mr205819485a.5.1783356976855;
        Mon, 06 Jul 2026 09:56:16 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:914:cb07:447e with SMTP id af79cd13be357-92ebb4b43b5mr205807385a.5.1783356975432;
        Mon, 06 Jul 2026 09:56:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae5c8ecsm19519561fa.35.2026.07.06.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:12 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:56:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id
 configurable per platform
Message-ID: <ftjlwqifp5drxvn3d6bsr6ldqrsva3rpv527fz3kjyxzylj7gq@ex7w7imyp5wz>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bde31 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=bjVS6o9MGAhJDIbh6jUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX7PXQXgmi/vtD
 zc+VNW+UnW5IqqAPbtBwo+kz/je4vY1gD2CQr22DH349R1f3IusJtuW6DtlZjeG1aL6XIznOFSp
 ohEMPaFFVt9mMIe7g/ZNr1W2z1sBFrjFsd7RHyTzf2WQK2TcqaCXGEHo9i7wh7P8iNvUj8NbiRK
 NGfVq6tlcpW3axd5qQ9te77lIHezIdS3Y64al6NkwanIg0rHPc28dyurq8nQWeWcAg5yw8Sj5bZ
 Bh7/nfm2VxiHS0LqgfdLYEp+xe99VkZte2DIz5IqUQab1aQvaALP4MLRZLNCiuwCACUgGFFg41x
 rC1gzsae+J7AtLMNkzKDozdPXBxVQ2nb3AVULNuQQ8oxp58ZI76eB4vByLGIsLddYwI9k8yvnWC
 aVKy/iCiZxJn+l+OY9fQwg7HE+JiuV+VZ6ApwYjoLGK9D0UhZfaALXM5wp5iC+EW8L2C5CeuSas
 sz4mO60Fimzft5mNalA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX+Yw7w6iDwap2
 wZl9p1MjDFUCYcD8U1nU3RQxw/W0N8hMuwjlAmPDOJEAUrwfVLfOclVajDAP2E52yZ9Wcb0lUxK
 w1x2G+lv7npe7M/NGOIJvlr1Qwfd17Y=
X-Proofpoint-GUID: xuhoEjnTeC3cs2QuFtz05yzUtFNOZI7K
X-Proofpoint-ORIG-GUID: xuhoEjnTeC3cs2QuFtz05yzUtFNOZI7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:barnabas.czeman@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4AB3713A66

On Mon, Jul 06, 2026 at 05:37:16PM +0200, Stephan Gerhold wrote:
> Currently, qcom_q6v5_mss hardcodes 0x12 as the instance ID for the
> subsystem control (ssctl) QMI service. However, some platforms (e.g.
> MDM9607) provide the service with a different instance ID (0x22).
> 
> Make it possible to override the ssctl_id per platform by adding it to the
> platform-specific rproc_hexagon_res struct. The same pattern also exists
> already inside qcom_q6v5_pas.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

