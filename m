Return-Path: <linux-arm-msm+bounces-105820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMOwDKcr+Wkq6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 01:28:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9F4C4CF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 01:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C54B3004F5B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 23:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E167F3A545B;
	Mon,  4 May 2026 23:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVgPpX9+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5QoQMMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A294139B4AE
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937310; cv=none; b=CtTNWIXGca/0a6UkpPleTWxwkdvb+RZdEQx+Qxm2u9xqgCwSO/yLmKhppVvUfcTa1gC3doIRc09+W1ohaeBaFhiX/clu/m3kQoVh9/vCKLjG3nJgiXMBjlapnp9rtEzWoj3lLUjxH4p16e9ObvePG1xEWTggddlsX8oomsCm+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937310; c=relaxed/simple;
	bh=X1GBNJlUxIvwaP5q19nAsgyfWzEw0IbvBNIeYZPLceE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxPq9NmmatTfUVCRXINhpKUmvLPdvRPFtsP+Uw6ebKLa3K3blUfIxX0OsIUUjGQEDSEfaBwuTED7lbOzZwtQ8nhRMI9WUC+8+yliFI3JnyFd4tI/H7CbAmFeRU5N+WIeMzmXXR7cvYasmwWipQNXdCCuLD9BpAFZbtS5Q44aZJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVgPpX9+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5QoQMMw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644LN90R1960442
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 23:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OW8ExNy2YqbaXe7/878R5Y8n
	r+DTNs0enLHqpGAdej8=; b=pVgPpX9+ch5h1jvr0aYu7U5WnTx6dOHPPtLEOqIY
	Ay+vgj1VgkRfonUEVRqKKX4ib+3B4pBipwBv1a7if59ypVgb6Cx5wPLQFNB+4kgb
	0XGeBe8SEMgwhF78ADancTisQtSzUf0cFZ0qwEmhdIMvg65/b5+g8+vHZfNncOH9
	X53RUNNPDAxYO6MKb3pLSp9ar3fMTofrOO+iNJ3+31QaOaMYdSsPHMDXQbIU4mdJ
	98RNLIiw10FvXUQIO4G2UWWb8Qp+IE6fTAypr/6RPlm0k6aoZyIRIVxzegY0AU5J
	rsqm07fy/bJG11d3vUc293ITBNOLxc5mG7MLaPk83FnHDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dsw3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 23:28:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so63111131cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777937308; x=1778542108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OW8ExNy2YqbaXe7/878R5Y8nr+DTNs0enLHqpGAdej8=;
        b=S5QoQMMwzFN+F1x7fXB2grRkxruIOa28BPaACTENdzmAe+MqfXYwkjgI+dkOR5mDKs
         xZyoZIWvR9RXiH1y3gaP6XnCRyNTn+15EbGbZHe3QcOULpY/tXog7kF1QwlN9pQZIKBx
         pCqIYvNfmlkVgkbj1lfNFoGAweXPyHRxHviQwDPkGREB0KRR6bwnvZnqzid14oENnMpO
         1XR4m0YvExx9MVAzqrtSz4Ln1EMWZGUgT4RmVYV9JbFzC5p/iud5ph1MWar+kOSwdDOo
         xYJcmV/NQxKlkf0hGU446txt48SZbyzD5nJEibekWPWiAw1FtcXKQBxb4ymlvs90DQFw
         Z3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937308; x=1778542108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW8ExNy2YqbaXe7/878R5Y8nr+DTNs0enLHqpGAdej8=;
        b=mLSR5Il+gwnpkiBezPnS1NUv8yG0As79IkUd7LP1zMfaO/cI0qhf/UJj8nUHoUB5eM
         RDcX5FZVl31kXsNTYAiCeNO4damQHur8HMbmDQHYRhNNFpxkbf8U3uliduvhYi7gUoQm
         1pc1lmuNA6WoaFJXWExPIFOLG24xFEX897oY7hHlDKZe8B93GQutdO8Vqfh6v5AR9iVx
         /2E3nfcMDf0IiWzYc7hG/MtM38ffhjXnpfYVA+YLqkTbthxjw6g6wyqcp+uPRbDka+CZ
         EvAYlfp2ih+YcqBUEjMRwTCh34Xeuu42UOMTAY/hLgSNA6viQAL+DVsiIgbUCtrgKqu6
         H9uQ==
X-Forwarded-Encrypted: i=1; AFNElJ/s9wtspqI+6LU7TaOJQEaehD4J3CXj9lN6LtoAtjCLDJh6zRV7pZp0+yR2pOztt+Icci3E6vHiOqwhrAZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQwSZs8hJQI03+Il/WecSrEkEf4ez/RVhgPB2oX418ziOUUx+
	5dsrL/Btvelk3O6uYDM25hIuX5I35fl6DpLavnuArHAlvhm+O2/Y6sJk8uIuuYXNijW18XbIEg7
	9DwseaufE5ZmVzJF1J0TNO52YxiesZvcT1x2z7t+1X0itceGwTGZK5BkMLBlnvZz92j7F
X-Gm-Gg: AeBDietNOBCRP7/1qs2Dqsg860MvzdllpSDtFMiCibwWcqE6PSEYO3c6vTeTnrLyb3m
	/GMCoKBkVTKmFnr5bCGJ/v/GYrWN8mJC17R8Wiea3Dh9KB6vbADxADP1T3AHzlTCnK6Osvecrl2
	P+Cmbiua+mtpsYi1dnDRY2Sq9mQ0K8XTk4iztk7TFmM1yCbLFagCrqL4U+VS/pMpJifBIjtGdUf
	7Z6lIEygVdjDxdcSijhLtzZ8XLG8JTWK210FmdMKb+YvjAU1LxEIcCwpbFV3Zrh5c5XS6o0JyGW
	C4oQqCxo1TZFIFUzGG9amrGKnKgXKQ7LOZjP+tYfMvmvqZCVv0EOk6j42VODx0nX/rgS/mel/lG
	QjDL7VVygkDDTXRc3gYo5cU7ZkRinzXRshhXfUlGulUCwZNJRBI+Ora0y8PEJgZJGM7/VI6A6gg
	QaEk084GzSilMj6nfsjarNhoxwsXJoPSbrNWK9DOftPk5cgQ==
X-Received: by 2002:ac8:5796:0:b0:50d:84e4:e1ed with SMTP id d75a77b69052e-5104bf9a7c1mr172864471cf.30.1777937307745;
        Mon, 04 May 2026 16:28:27 -0700 (PDT)
X-Received: by 2002:ac8:5796:0:b0:50d:84e4:e1ed with SMTP id d75a77b69052e-5104bf9a7c1mr172864121cf.30.1777937307244;
        Mon, 04 May 2026 16:28:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346ae5sm3392670e87.73.2026.05.04.16.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:28:24 -0700 (PDT)
Date: Tue, 5 May 2026 02:28:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
Message-ID: <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
 <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDIxOCBTYWx0ZWRfX8AOWPV2UluyB
 OBAwctmbU1ZrWvj/AWUi5qmqr1zJFEr2jUH6f792lsIJk5kcUo78BhUm8K9vxXN8vP7/DmP6osy
 3cwS+h7T5YF4xIxxhw+LjylP36XDY5qxWTiH8aKwPl6ME9KIdgBT50+h+lWtHHKfCZseUE7iRJn
 iR0F5Ma3BFwY3SerclZvRw4y73LFUi5EYiUpy1H7YWQsO7H+a6r0IgCFFwfZkYrMKTEYQpazYcq
 skisCv7PsjdxQ35LH5mzWtc0bQMs4izQu+FtcPe+DdtOXruGvFAzg8Ze7iWSv28dJIiEDujhuPH
 UyWdceL/PMAKQ2K7gkrQGeIqhn0JiUlM3cpV2xryo918LEgPRtN1gDiH4wurykM8LEt+zTAQBbk
 h3hMJr0zlEaajIlSyi7lJtVaHoFy7HsA3PzxutGw6SrawYBfxALf/rfYeAWh5rIbzGBLrtQdJgI
 pdKcCPt0+K81ZRKTyMg==
X-Proofpoint-GUID: h24TogrvyQGGKMWJ55HujlDDuMP9yw2b
X-Proofpoint-ORIG-GUID: h24TogrvyQGGKMWJ55HujlDDuMP9yw2b
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f92b9c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5WgXPmZedZYfiB6p-UsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040218
X-Rspamd-Queue-Id: 80D9F4C4CF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105820-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, May 05, 2026 at 12:56:15AM +0530, Umang Chheda wrote:
> Hello Dmitry,
> 
> 
> On 5/5/2026 12:14 AM, Dmitry Baryshkov wrote:
> > On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
> >> The monaco-ac EVK is a new board variant which shares the majority of
> >> its hardware description with the existing monaco-evk board.
> > 
> > No, this is not a good reason. Is there a common PCB? There was a long
> > discussion for it for the Hamoa / Purwa EVK.
> 
> PCB is not common for these 2 boards.
> 
> Also, not sure if I mis-understood you - You had mentioned to have a
> common file for both the variants [1] in the earlier version of patch
> hence refactored it this way.

There was an explicit question if PCB is the same as a prerequisite for
the unification of DTS

> 
> [1]
> https://lore.kernel.org/lkml/7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn/
> 
> > 
> >>
> >> In preparation for adding this variant, extract the common hardware
> >> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
> >> include file, and update monaco-evk.dts to include it and keep only
> >> board-specific overrides.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >> ---
> > 
> 
> Thanks,
> Umang
> 

-- 
With best wishes
Dmitry

