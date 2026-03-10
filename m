Return-Path: <linux-arm-msm+bounces-96408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHwPCtpgr2kmWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:07:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59E242E19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBF7C3021D3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19560199D8;
	Tue, 10 Mar 2026 00:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Omrl9Z5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikKJxlPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DFD82866
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101238; cv=none; b=aapImMmbQiXKiPI+3GI0J9E2eaAixvIyEPeBbaIqRWWAgab10dwSRugyQyoHBhOZWvbxmJkSeLtaJgZULxswnRsZTH4Nj1us+UPbyYcST3tL//M5mYlfmCwc9GFNPHpdhvpNdg3dLdTD+ppK9TEWxhErg/X+ZFw8gPWG1pv96MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101238; c=relaxed/simple;
	bh=3F2v7hgwZr3ASkPIOrKgTyGTogdHVehCHM7L3OoGrn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teglAe9Wz41qnJnFsfdyqZ26Hdk2s/ECfo0FU5ZGKE94OoKzbiUim3q+Yw7RxrrRQ5mrNLivHI569XX+9v84htMZrhrDMfBTZbb4rlsJqhXBXlEmzt9ajlC3QJ3aWgtB2E4ctz3PF9pg7JYqb4YF3E0LBsClhhfbWH56q0QYRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Omrl9Z5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikKJxlPl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBvrZ1921513
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wz0pGWQvcqBNbODzMfkbDFxp
	ojP6Pl8+dAJsLfprVW8=; b=Omrl9Z5y0ASn3p9OZgFd6Um46iUkDyJfKRJLJrlp
	SUxeV6VpjDLDoud8YjQWNEYro+I8Xya2uzDaAoWxRN3cVSUA+BIXWS2n1oPkJi1+
	eIfJX9nm8r+pNyAGPiW0UFyJD2JTLrAZBvRf35OwlA3NhKJoWoDjuUIA3SLLVV/D
	/YvZDmTfm3KgU3ATSPv736RNw2onpNNqv6Kd3vgbjBEkTlt0SgvPJxQvplqq98wD
	Vl0srS7Ut0qzYbPHAMnKGwUQzyvBrwizfdX/Ov/7i3BABT3kTETBfpg0xWJc7qFb
	DOzqKzQjwLhABBbAF5xt/X4TrIkDbf/zf/UNCBB8X0w49Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy820m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:07:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89463017976so855219226d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101235; x=1773706035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=;
        b=ikKJxlPlrhtPKkQmSTCiYYjq0xOyBOouL2ZzliW2aCeWJhWk/k8upUnw3TpLUb0B7g
         LajC9SNU1fjZL/GIwH87xulYTddmVCpvp1ulhX95sJnVakZk/xRUFHQG4mOwuFF49T6+
         waTGMd+/i005kzKSgX+7gCzG7NaChxA7J4YA6HU9qd2jZU2UQvq2TTOkhAVmDMAhp3gO
         R8f1VaqN/CFegrjbK1Nc34saQQ/UzqmaVDrJn8JhJ6apY6QATYpjw5eIAGnHJhdlCjDe
         xQ+faJp+/QjcjBZkyw1bOTh+vZszjw07laS8jlC9jx91E7cIeb/YsA7vhvkSqgPrSPXQ
         ys6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101235; x=1773706035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=;
        b=HBzLMb+n5HKICkQzJtMy4YgUTLQbzCCtuFgn9Jo87rY/1CJEMNFxILuQShxRvNnuWj
         dNdIu9l/qn772rX9Wi7lK4GD6Nq/dS5F5vycLNUxy1UQ2QPIrD3hCtT1BjEfc/nVGZDj
         9/ID4t6eER4RD7Np8Xx6T9aSNuNUukjYBnSLTKuZO7GNMIWXJGHk9V8Iy+lhV2xT38BB
         a4IQS2xGXM+MIQoO8XDa/5jJoZb4yhkbRrNqiocEawpsKTMhOtFh0Q46QOkScmpe77yc
         3hwnO85sctG/3GxHsWMzb3RJly9EfsrOQlS5GEDJ1ybKe8dXS41xoqI2GoUr0pVp2bN3
         lV0A==
X-Forwarded-Encrypted: i=1; AJvYcCXoQ/nvJAvVvNnpn3K9esYIrRq/tj+Czb7fl8e04v+2A3exZTYPJnmwjdV1dSoFwfVZS1u/b0Zh33TLSm+u@vger.kernel.org
X-Gm-Message-State: AOJu0YzyFWQMwVwQGXlUPDZ/gJUWnyyG08jCwOc/6fvpQ4hclMTqGH+N
	cg+GpjP60LkUfsIuAtsptakK5QY/uE27m8uRCmKo6dEuHd/qbpJp/bqT3vlZgZT24ZT5vbeyuBk
	oOD2+uo4XqVRO2c2x34Pa4RHiR0l8bMbioy7MSqm01l7KRhf2Ab22aoh18IIj9zaPWTZf
X-Gm-Gg: ATEYQzw7/QZHAzqLkI/gPEBr3tqxxyYuZqVjGjfin6B32xd9MBzbxVW9tzDHoA8nUfa
	4fUjKz/UYtYPVz37gXhJOBrUc4nh5oYxRMEwWOFbPhBR104oyCE0l5lipoURPHqvFWQ3cxs4bLh
	u1GGxG38TSSz6zNs2+dbDo0zqLP6pWsZ5nO5urcqVG/MDXe/xVMpl1f3JyvoG+3Hehy5yEr30zx
	Ix/ubDokpltH2JRVgkuYtX2Uxl9AXqFhyvw1SYAPLkZOdeuNrrReYh3itnfmr4tklcc61v38+3I
	dk5+pbBBSe1kRCS2mV5EppnwtyrjFGHH0T6PZr2IJ6HwzEu3gLsWnCbzC6d6TXLAvVe1BZhU03z
	nJLpDvxRCtPqI/wBjpuOUrHAmYppR51lXfK5mEmJkC8fKUkak+bLKYWbKm9lqUrrsc6xBGad/6p
	IvqljnUaFZASUneI1bGNOHjGKcB3fJQJBF/5A=
X-Received: by 2002:a05:620a:3185:b0:8cd:8f94:259b with SMTP id af79cd13be357-8cd8f942ea4mr384673985a.33.1773101235222;
        Mon, 09 Mar 2026 17:07:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:8cd:8f94:259b with SMTP id af79cd13be357-8cd8f942ea4mr384669785a.33.1773101234727;
        Mon, 09 Mar 2026 17:07:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1459sm1844501fa.1.2026.03.09.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:07:12 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:07:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: Re: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <ljv2kfghtbnghu4ihfskli7zhiwme2owzvtuwckbbtkcmhuyel@pa2cmlpz73th>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af60b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=R1rXswN30TRtGkWU7PEA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: P5EZ6SaSUinm-iZRY6WD58xeg5d2BIp6
X-Proofpoint-ORIG-GUID: P5EZ6SaSUinm-iZRY6WD58xeg5d2BIp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX68Q1LlYoDstz
 Apra6ll+HH+L6wQUIIbhuobMaWCQj93tZOTZBmdPQP6rAcSDss+cKFnmg/rf03Ft6fkz+oNXnHg
 eNkAeDjZrgMEa44C+oDTOYsnhH/zM64voh39gQmGDb7zqLTRA6SngtxaXtiwmdmUeHHlwb/Dws5
 tD9536W0BMJfZ/kS5lNVR6s3rMHSwrjQT2rmPvSyuoESdgOFve29fli45/WvKZruisF1+pkcGLU
 KXFaFl6lubyT+AfsUiVV11gf6mNnYzjRzQp9OXj5cMcYOwgfxGexuuXcD+D895OZs4t0lhy8NvH
 PxyUDwqueRDWItblIZVlK5IfjHLpyrvHL2sRaKk/oMnDLkH5GmYypTo5i+1pn1kvvuZqLWNQYcE
 cG8zLD4di6mMkAx4HLkcFYFJbUDLN9vES29ToMbYjpojO8byYKGPeUY0IIxsD8j9euQ47Lh1lk/
 xoj7nNrIm+VtY9cASRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-Rspamd-Queue-Id: 9C59E242E19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-96408-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,perex.cz,suse.com,linuxfoundation.org,arndb.de,quicinc.com,lists.infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:03:36AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c  | 2 +-
>  sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

