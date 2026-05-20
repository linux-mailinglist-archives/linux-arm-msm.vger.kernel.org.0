Return-Path: <linux-arm-msm+bounces-108770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HA9WCOrHDWod3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:40:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F658FD22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 888B53014C7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5DD3ED121;
	Wed, 20 May 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgWvSvcc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qvq9h2D3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B43EAC86
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286799; cv=none; b=kd3UpRd2zzz5XLRt8E6zdxmUWG7vjqArFTZt1G5oMwvPBx+AgK8w5sfXiv2NL+AnzT6Uk1uEuhIut5cmG49nt/ZESue7Xoq05oG3VAZlKm6+lV8V9Fs8iwY4hYabXrznrCuCoe1JvJlBnKYQHwbasXdV3yT+FRAtCGYU0vcO+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286799; c=relaxed/simple;
	bh=rCPGrnr1hJQU0fy5uz67DYTNGl7r43EjAnLT/MB66jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6Ft2PPB0/CKGTjLyUqo8O9O6LYlpiwMRmNeV3zYgiOgS3X1MWWm3EXWeoTfeKZq6XxEoFBpn+Xh7l535iuQeciIla+4yZx2kMJsMeDmg5LT9eywTCfx6+TwGCJvSRNiF8jZBgsVyhS3P5+S6mJerC1nmqrG3v62+jGUWK9stMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgWvSvcc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qvq9h2D3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXafw1797792
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6tCnNFj4WCxpcwrHOfsYOWMW
	qwLTQRnnuiD3kfu4AiI=; b=UgWvSvccqLfXw468Tkb1E8z6KQ+1FXfgivcyie7X
	7mRZ4oCLQU1RX9AnUfRXMQrsZMMMiDgAVw1X6NOgmCry+U0AELq6l19HEamwzETn
	3gg5F6tydxeCV6hvpsj/COwqFRUSJoCNzxQgEaaPqYVTCLq71D0ajGtpX+OeeqOq
	HhG74oxpccO/ary6rB+UwoAHJ1Pv9dIY4ZuX+tp8HMgDtY3Uw6TQ0jS5nB2TzzkG
	CKUC9UbymTzuzqxqNWBHg38Fqm4K0lK+Im7H2LDH7Kr2h8eGe17dYPmROTcR/1AI
	lE7cFSgZTKqxEMB5bh3X9ggyJsBA9U7rpLT+t2G5L3890g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu05c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:19:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5756f9292c5so4238950e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286793; x=1779891593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6tCnNFj4WCxpcwrHOfsYOWMWqwLTQRnnuiD3kfu4AiI=;
        b=Qvq9h2D3vGrNzzwZc1PBQ1QUm4iEDv8HSR0lO7UVIkVDm+WGzF2acDUk7mbOA6nbNQ
         OucXiE8yEUMCR6ljsgKBEVyJ65hRbpRlMKejLNsBeIy96AL/Pv6rEsGREEhC3N4GVF4A
         afplZKqST7FqTfa8a5nsb2dSEgWP5QzRqcwwSfa8L8evfcz0huOc4+ivrmEybbLD89M3
         fO5d7lPHALy4nxqTJnvjmJXITmfboDmK+ZuA2qvNVXzgrN1oz2ahd6DHLZEWHGvcRD0J
         Su21SII4+qxCOUzoW2/TnjOZfKqe39Qo3fJ9fRedprmcgvfYgoYgxFLaTX7RN6uM7Wg9
         tsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286793; x=1779891593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tCnNFj4WCxpcwrHOfsYOWMWqwLTQRnnuiD3kfu4AiI=;
        b=BT1rPtgnJwdrlXT2ewfxN9IE9HnGYr0vOUSIjEk5j6bOJeSQXRcK/EjdxVVv4IOnru
         T/klbrpKUlWyP7X0gbXmTkTnINSLJ8IMh6Bv5qigouIjR4QyZBnb0h7KcyDM6d55tCm7
         Fv8+t+i3PkWblG1kz/A76RiPeyaPWNdlujmyYmiTj5/Z+l583gKP9gcO2NR7vTN8CPp3
         XajS2k/SVez7lKtmCDKJWTeZlAS2bXjuP4V6/BiCqDnJL+lM7JtneD7wqIwyBlU0OW4g
         ogKQQRF7nd1V8Et/4L8sf58tm12Eaa9QUG6sObtJ/yZTCzkILWSgNUbl8TCsf2v9JJBA
         fVSg==
X-Forwarded-Encrypted: i=1; AFNElJ8sQxTue+kCgOpLM9q5Q5sLExCMEu0tAAjMAUEb0tjKfBsznrNyaNRGB+h8NRwh1ntchsSA2LK+cus5lStw@vger.kernel.org
X-Gm-Message-State: AOJu0YzYKM625nCciASPc8pxGJf2Wv4Rc8NO0OgTm2wwchSZ2MvGuTnW
	/VljvJoiw48hQNSBCYSCBZuj9F2St/+KAlBuAPb3O9hKrqxuhBQiNV54ZMsdVWuk/bNWuvyYEud
	26JfzSV/b+eJHhEAv59UvWfaPmnOIwl3f3hQD7lrJYDfWb6+GvPPrrNiKCCOuvI59nqN6
X-Gm-Gg: Acq92OGNfcOVRVnRqjUackANazkHtOlSEvinmDrLlynfvaYg2u8vd8L06i2VSV80AO9
	pErSDVeEJMA+rOhwnVy/61CsXJPTc+P4fLlyUsFXurEDY8BigryBLJrCU86qMLaaM4gbldQIIbb
	g8RDkEopK6bJn94jFrCTZQHglU1K6PMcVKdvdI5rn4XLGwTCKf4B9jU/XZOioRnWcADLn5NDL9P
	w67KNORKQT1rSObnRvfBkcQ0RPnYtzNFa+K9wAHus2BzzKCa30d7lHLOahcEXN3RL3x1zHnlRM7
	L/DyH7yek/Et1/fjKA2/Faj/FkQ4F5hlLE5H+0eepF6qHJZ5TYVTzamT1TVjrk7Ah0tAJw/1psg
	LpOhUl3qY60hKowJGyamGE8980YT4vQAQsLFJOHZ5X1D/ZCC2MOSh62J1fbUUQ3/Wj8GCLpL3Fr
	422ldH09VY8SYAxmrfNDz0v/3wu1YXKs/4hNE=
X-Received: by 2002:a05:6122:828e:b0:577:559a:3ef8 with SMTP id 71dfb90a1353d-577559a4a34mr8499339e0c.11.1779286793228;
        Wed, 20 May 2026 07:19:53 -0700 (PDT)
X-Received: by 2002:a05:6122:828e:b0:577:559a:3ef8 with SMTP id 71dfb90a1353d-577559a4a34mr8499265e0c.11.1779286792601;
        Wed, 20 May 2026 07:19:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc12asm4981844e87.42.2026.05.20.07.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:19:51 -0700 (PDT)
Date: Wed, 20 May 2026 17:19:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
Message-ID: <hhqbykyitoqjyekwn3tdv6ytzzg7hv27tqj5h26frxxoe2j3do@zzng2lmpfz2i>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-5-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-5-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOSBTYWx0ZWRfXwAb1XOSYI/jT
 ULJjAHa3bk1yC3lufmuTpMFkK9tvPD8ZVphu8BUweb8ZT/T7pWKjqdfuvYWbOF4xd28n8g2y9cy
 dMPN+80hiwlwq/5orhC0+Yk372f+ZptbLoZru3dhSzHwobReaTKzXS9d/fe5CD+c3lLxTbrKQnX
 Qah5FJP30IXVo+liorF6zVVjnFFp2qgjt/d5POPDn75wxOIbK5i/9JVGc4GkTlgh0m6ffWBwaKz
 2scVZ8wCR3PPc/oRC3NLzjDUOhyB7lWPdeOz6N1Zwu9LHIDuSTJAXCEHnL+HQqFGHhbCTSEXJVD
 0hFYvOuuX1k+euufWgKhYYgsFyHPC/i0dMRsQ+XsnKtsXFimMIO/hI/Gh+sxxSja74NMjN/Iz2w
 op0Pw/Iu9YEcIugbhWwkBkbag+votCBMwI2teyQ//M5jVf7voz2l/j9FKQ+DcEcesMRjNFA58/7
 9xuUiI8I0AKStVJE/Hw==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dc30a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lBWuVeWgvPZisQjhOOYA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 71yQ9QqF611boH0atJS8vAjJ6xI6FSfD
X-Proofpoint-ORIG-GUID: 71yQ9QqF611boH0atJS8vAjJ6xI6FSfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200139
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108770-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 907F658FD22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:45:55AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Register the QDA compute context bank bus (qda-compute-cb) with the
> IOMMU subsystem by adding it to the iommu_buses[] array.
> 
> The QDA driver creates synthetic devices on this bus to represent
> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
> so that the DSP memory manager can enforce per-session address space
> isolation. Without this registration, the IOMMU subsystem does not
> probe CB devices for IOMMU groups and of_dma_configure() in the bus
> dma_configure callback has no IOMMU domain to attach to.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

