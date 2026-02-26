Return-Path: <linux-arm-msm+bounces-94204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGQHNS2wn2kAdQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:30:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C71A01D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E132303EB89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 02:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B82F374720;
	Thu, 26 Feb 2026 02:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q17Kx0SN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGL4eZu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ACB376479
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772073002; cv=none; b=AZF13h8W0r0meZU9aO/4L6J18gR8MAaYXcIPjjkJehAd/Tz7Ktwzm3PoFdJiLkLzhRrKevnQfHRuCivAeQcGTwpbje+OOwOzlN4hghO8+nTXIlD+SK6+ZpKb8JqW9w6F5ps1+/1WrOCll4ulmloajFgv6YqK8TLnBugwo68bUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772073002; c=relaxed/simple;
	bh=49Ekx9OKflPMVLXwvJatFnAdSlHP6s6g4eNtzYGnqH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZLC851tCTFiVGMaFP5t77J+0XsusYPcD+qKRlj61D1qo6VnF15nBBap4iB11FMxX7UYJ+Yfn+B61paSTYbBn5afTotctdQoWtdW4B3o3DzMeh4cwlYb1+VE2s0YE0I3R9XX7SWww5ntys6iGAwc2ma3JSmV4v9X8q+RJv2y90o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q17Kx0SN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGL4eZu4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH4iYv2561179
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VBNZ3ESznjVmsrQdhZx/99Sf
	Kgu1tNqPlP0XRvNipx8=; b=Q17Kx0SN5CmvMC1JgwsL84l922/mhIBhe03Faqn1
	yeiDX2KbSHNV+Z4vffOs8iyzf+FW3gskvcReREHv15mgdpFOpavNCRCdrzYKU9Jf
	GOMrNozpeW+py/hyVA/9qkrIyWglA1uLzu4sObRXSco9A4Fo0SYj4AB94fyhR8Rr
	EvbtWNNdUybl2wVP0Je8bfDuZeJiRhV5QZL+ASpIMD4KaGpW0ocnWq5Xw5a152X8
	A8jhUMjJjsrNkAwSHtJ0v1TREslgJi/3AoWHWa7q9czmHBhgUtWLiSkJRC2KPMWU
	wn7qaAzyVln7ZU1VKSkJXpj8KXK928Eezh6yfJQKCmqYaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj55ssdsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:30:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so269855485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 18:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772073000; x=1772677800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBNZ3ESznjVmsrQdhZx/99SfKgu1tNqPlP0XRvNipx8=;
        b=BGL4eZu4iBCm37FsT/liKRhrw+UNfxVINNaHiRfN2uT58bxfuIu6KesNb0dOcKFuIN
         GbcZVShDdXtlsBXeOC5E/+Ez5HUa3w4Lykd5IAeyIpIcVbwsJfDN3o9ZIgMjT1RYZjd1
         rofYjVThvLa/fDZRf0RwCU6lhUR5WaeCNUZY0jmex93tUmKDx/uf1Y92BWkVrirm9sDo
         Ws0vxIklRYSxB2MZ3LkP9nrERQmqeL1KBGNw/y5NI7GkPfHCostx2emdgkfshUa/6Jd8
         glnDY6dfU+Wij9buzuxTbWyONPdHv/48j6UpxhbSLCRDT1GlKbP14jYSyyTKfTbupq+W
         pZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772073000; x=1772677800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBNZ3ESznjVmsrQdhZx/99SfKgu1tNqPlP0XRvNipx8=;
        b=JF1nbT4IPN0tyqkZgUy1dTwsc1arPG2nFFQGAqhhcwb6oiXcrGdYqFbiqqCAr6Vn+B
         gHuDruKOaKEhYa7mgjGFFALn59Ht6ux7rCkvWqza79DEdjM/MdvjReuHhG1K1ftQnUfo
         dYlDvPwSV3ASwTWJ1aKcpm7ipLbiPDBV36z56vpHEV5wt9RdrUmJvPbR1lhmGWtbeVsW
         Ea6vpXYCSsQdD3otdqQPSRFkOSdfGAlb940yXIRQ9k8dzUmy49FPmzewGgLvZbfgl1P1
         MyTrifBVoCx70Tv/MMqgDut9S1T/sTwJvg8BlYc6bGyvAxhlUXAgw95nzt1uj139a8pT
         nO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNwzJGYnB4dGWNrzevMslvq0TgqXFs8EvVoQ+weV5c0JHsQOLz7PkYq/rRsmAjDH2ZdngQcC5tcCdzp+v/@vger.kernel.org
X-Gm-Message-State: AOJu0YxYrnoyd3am18OK91wQmQHfVzlNdeEgZMpxXXDH0M0QBj3zQ2hP
	JF/9oML6/X68isdd+g1NcWPVk0dD6OoXP2k/NmnbF7ZWHj2MSMCk0hFML/EiXqgNLtJ8xt7sRIp
	9aT4RMsXoqYnryuuYSyOlMvJQONzD3jkIaFQeQcAD2f2B01gyKVktM/zU3bE52SeTL4nEYKzmCM
	y6
X-Gm-Gg: ATEYQzwzv7T9refQZh2mqihPfoDDIGdCKWssELfUIV2SLEElpXl/OCEDmWIqNd2YgDO
	iu/oMLYZvis9bbc58tFhVT9dHsrINUnB6mkQPzXTxfupOue0oub95/xbcYzs7iecZV7mhTl0toh
	JglpM77IBHbQ9lzkVJxSY0rIQ8Dh5Au8KM22AGXtcUyGnjkz2JO9/b4v5SRuLr3QM98iVwk0PIl
	xwcLQBvekVccotouraFs1t4Q41EOv2esjIewzqVPGvHoiWzyRJjEkjRimufx3jI1qN3NbsPPOAF
	0MLDBqcr0TafYpfhVy3gJHiQwIhnidqzAQsT8DXWlp1ZCu9gfY0LibK+9O3GtUuf5HlYdXNnbEs
	+0WGHF9iJ7eVTBKPSHep2CGMflF+Vx4rQMkZ0hCmrSh0eQHxAQiTG+KU43TeM3kkBWKFUieIMi2
	T0zdkxYl83kniP0unq+ik0FeuxN/eMf7LYOc8=
X-Received: by 2002:a05:620a:400e:b0:8cb:38f2:6a5c with SMTP id af79cd13be357-8cb8ca0358emr2282261685a.32.1772072999577;
        Wed, 25 Feb 2026 18:29:59 -0800 (PST)
X-Received: by 2002:a05:620a:400e:b0:8cb:38f2:6a5c with SMTP id af79cd13be357-8cb8ca0358emr2282260585a.32.1772072999126;
        Wed, 25 Feb 2026 18:29:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e08a2asm209549e87.37.2026.02.25.18.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:29:58 -0800 (PST)
Date: Thu, 26 Feb 2026 04:29:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Allow QSEECOM on Glymur CRD
Message-ID: <nszvm6ohoqfhp4zjbbb6g2aolaipcytvfrol2qaouj2gz3lw5d@qytwpdpdjo6d>
References: <20260225-qseecom_glymur-v1-1-0cafc709e2ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-qseecom_glymur-v1-1-0cafc709e2ef@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyMCBTYWx0ZWRfX5sv0NHUVPJn0
 i6yeLCQG0Ge4ADkDURf//49YV/qyWQGAwjj+stvM1cpwcF5+tpFCXXSBtbEEkgy9jS5sRa549VN
 khst6vxpumgGKiqH1zk7fuvXZlglp/MivUK425wTYE6oVXqijwSjrabxywkoBrL8t1c60XizEe1
 5PoVhSIKkksodBLkwnHuKe8N+9WP51PTO0mJklLH4c6630MMvAU7mwn+eCXurqyQLudnwag04IH
 JrFnMf81H12iEcbjaNFtOAE0TppvgQZkptB3CDtraC/flUwMtpmVab4zkUBPF1Q1Do54BQ3eZTS
 Q/RyIQ8+rzqD0aJu9UNcDMPjZYl3MOUuu5cQxRfZV9giq5Ngn1c7AJbcpBKOhSMxHuzVXYOhLF4
 5/H4Aa3CaWjOk3/QcKJYPc2eXLfk1/qBMl4Tm0/mlQSs2nUReifmCkbV/jAaVt8uJR723x0gSjM
 d/oIIbrEgPFwTyXLzNA==
X-Proofpoint-GUID: XOc4UP8qO9A9tip83eka7kjPSwVEo0kj
X-Authority-Analysis: v=2.4 cv=JfGxbEKV c=1 sm=1 tr=0 ts=699fb028 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=k1UqL3rAfhxU0ONSGEoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XOc4UP8qO9A9tip83eka7kjPSwVEo0kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94204-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 516C71A01D0
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 05:37:24PM +0530, Pankaj Patil wrote:
> Add glymur-crd to QSEECOM allowlist for enabling access to efivars and
> uefi bootloader
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

