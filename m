Return-Path: <linux-arm-msm+bounces-108081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFrNDjMyCmpvxgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 23:25:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95101563FF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 23:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D046301D336
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 21:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB1230EF94;
	Sun, 17 May 2026 21:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TF3vj+r9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qi+o6nRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278142DCF52
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779053099; cv=none; b=mxP7mLCeKTvblSRH6rNoqOsPN/2zeYeIHptwL2AORWosjkoDOC4ddmpMNXzmYCHtgsGOwwvvLZSpUFulH2MBe9j5yfwHRRm9KeyHkZFrtlukx8Hx1imh6TwiVCj8pf/fVFFRipD2BBm9oH0oVItcbRo7/SQuoeOVRlXoqnCVZ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779053099; c=relaxed/simple;
	bh=Ntpg2Gyvch5OmrzCoxhFjOpwjquxUKtWeYRWnP62d48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAGr/4oAaIQZbfmNtKw29wqo0IA98xJF00a8YvGe0Ua9Q/AL5AKlJycaa+hqqOC49BVQpP6l511z87eGjQerPysxT+iW/Eo9YBn8y2R0R6TsOeQqkiS1Xj7BkYP62EOUjUhvtxjQHA0TltDUgdWyL/stvS6zCVjo5ulcjInT03Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TF3vj+r9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qi+o6nRI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5ThC33835038
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 21:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vJ+pq0wVqiTr5Da621Qq+GFD
	AAi6LNEw4Xd4lZj0BSc=; b=TF3vj+r9gC5N8T6347EzSoEqkRCosy8HHvJldvcS
	nhc7iUIJ0dEagFVKwPj4YGk0B0ZngqT4/B3fV/zBmWtoi99YMhfGVeN2PVsQk+QT
	qqBiaCdbErb6aPR4x2BTmX1jRBXkD7E67tsQr2xUXWrPxoRl3KNKOMdyT/fRKBA/
	Tk7bHTcSp27aFxrlmntHeNEQvoZiHcJaWhNzbVUJozT/aHg37+7qVnNmZeOqzuoP
	gESKDqFbShp6YhABdHH9IuiUghnI/TMjgtGrP9oN6fJxgEMPq7ZmbZaIGGsc1wx9
	OyTYZ3+NbnCYAtcGgBUsOB7YK0YBSAxWmFKdATNpgY4V1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcbje2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 21:24:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so19080986d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779053095; x=1779657895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJ+pq0wVqiTr5Da621Qq+GFDAAi6LNEw4Xd4lZj0BSc=;
        b=Qi+o6nRI5UvXtJXspbKmFMy0YC6jC6/UZFkguH0xxiXSIM7jun0SNsJ4j/pdgYi4Pu
         4hrgBmk74wpYnrrXGi4WLUU2So7CsxdfPgix2PgPUyGXj8dhwg305p7biPthlUQNoPLY
         iOzVu5QuSx74Qe5BpyJ1cUDfM7CoCEV5nXNdmsJNzOuMDEKO8vixvKIrUrUSlqUqZPpl
         CSbbCUWvFrvM6qdxpkWoBVSE6afyh9j5C2+VU0fjOIWRSCHz9CYmcV4nLb3UJzOnXEg/
         0tGBTjjmLN6sq4beaKZat7VkneT1cnxhB0vT7EpwJp40cbF6N/3B7CnMYMHdhhkxMLiU
         uEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779053095; x=1779657895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ+pq0wVqiTr5Da621Qq+GFDAAi6LNEw4Xd4lZj0BSc=;
        b=TMG1wskXQOForZEL4Xgl/Cp+LoNf+2OhN/g1NhLU7RPeOQ49cDheZ+rHyhs1nVntRt
         hcXS0LX2LYCANNR0/FYJ8GOgXXT0nYHaABGaMb9lsDCIvL4nalu+wCIpl+7vQuJZSTnW
         eWbWpOLZnHaZfqU0omc2LP+tEjAaP0ng/svS7tcYvw8GNdD82cNd+QRJ3t2t6zmGvfLc
         X/AifxTMMxSt/z0HKXWUir7Za5erFR9i7D37jSt96y01ptOACVujsqlOLc93LwXetPDM
         CT0USJLH0JbAMN3a9dbwczZ0Dt1UjC0UIzeIv3oPGlVYMnViSUbraP36EjyAITQtGd9g
         Zu0w==
X-Forwarded-Encrypted: i=1; AFNElJ/gcbVr1OWXggjUP7mad3qr9/+4+RCxTlL0W8SB4gRPOtDQT/MYf5JzsBQYKYakoJyp46qN1Nv9QvLrJtxI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9JK2UlhlvFDrAB0sjUJgqti2BvN24hwCE0fE4WnoLlq27JNfJ
	ubv3stOormftaPmut7UYQd2vyUuC7t/Lc2c7+hq1apDJgLZ7mrq+kWHE2dwbi6VyzdaloGRj1Mf
	IT4PJvYJzSrvV08Dbx+jAQvgdKXBl8s99PtnT4WCkl0rCfyZ4ZJ3LeE6BtqNoRAvXr4xJuQbfnw
	mv
X-Gm-Gg: Acq92OH/wVg+/oSRtBGhMrcpyDELqLotINKVz3iqY2WG6YKO6BzLM5CWAEFvduyNIaO
	mOiuXHgkBu7rbWr2RTzM9Myzjb6hHt9vFlPov6djQHvuEazdQPlYnjrru+ju0RpAv6kuu4+kw1E
	M0KIN3ZBQ1LZjSlGLXODaDgLzv8czbpwGT2JvMghayx+KX5xBD+M9ncllg1x+ldR565SNdVK8FM
	kErGfEbVlgIDQ5vgu1iWmHpEsOO4ImBrG4Uqzm99d+2zP7zfuICT9FY+RWZveC8h3DwpX4HYHSR
	kzTtlM+nIoglXE8RpQQRbYsoKjJJXir/2yzqh1XODE0CHm/2aqAdK7F6LSqXCdgowMErjAJ+JOZ
	bAajmXhsPbyD9pquJNwqNjXlOMniGpOEXlRU7SsDY/pm+EcDU6eQpUluTwY5GkMNFWn5EqKSOFP
	+EpWXTRf5uVItFPUt4by/S3UCHVmitOlmyB2s=
X-Received: by 2002:a05:622a:250e:b0:50b:4491:a2cf with SMTP id d75a77b69052e-5165a078cf2mr177666721cf.27.1779053095422;
        Sun, 17 May 2026 14:24:55 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:50b:4491:a2cf with SMTP id d75a77b69052e-5165a078cf2mr177666511cf.27.1779053094986;
        Sun, 17 May 2026 14:24:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10ca52sm2871074e87.15.2026.05.17.14.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:24:53 -0700 (PDT)
Date: Mon, 18 May 2026 00:24:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH] misc: fastrpc: fix DMA address corruption due to
 find_vma misuse
Message-ID: <hkqh3vriu6tqkxi53t6mvjn3hare3qbrkdvwenk2rfmtwoq2ft@nctcnnu47mwh>
References: <SYBPR01MB78819393A1F4FA658B2AB076AF042@SYBPR01MB7881.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYBPR01MB78819393A1F4FA658B2AB076AF042@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0a3228 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=pi3H7CPb95a1Pu1mXnEA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIzMSBTYWx0ZWRfX1+jcEQrTNIGx
 qb7X7lK6iH/35Tkkfk32YO/N7VtHtcPASkzLt/uY7uX5OTT/umacX3UNzpkDzFE5h/krmhb7qaw
 i0sD4bNhZBiXaSG5AizQALeCm3WkSN02hqVgMFD0H3+9rXoujBGHgIMSUuk46kQuC9Jg01MXtdo
 rJbm/181zQYBpLdNb2enUK8k1UkXf9wG9ZlqtwcWqv/W3rsSl3lhgbwZr/716OBI6hAgyTqsR3L
 MEBOFGdoRWx2p8HJ8mIlHck/+eQwgcHHBTFAFm+WhUen2GX6HGDrFPFDAmV6HjkcF2KLn6SY2wd
 HfDYHWWxiLhET40oUYit7Mb+nULPjpHSYGjumlaHXGbhKZRXOu69oScCucLE8KQ6SHJrhHq58Za
 QF7uQQ/uhFIlx8uCnhLen9DvsUg+07XTDjmdmXVxJ6m0fFVkrxYo87me5JkLgGyeqJE7/YZExdB
 11cFABqkmwHn+eKVkVQ==
X-Proofpoint-GUID: 4MmTla62B7HOqnCPe6GFKCYlh_S5nzuN
X-Proofpoint-ORIG-GUID: 4MmTla62B7HOqnCPe6GFKCYlh_S5nzuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170231
X-Rspamd-Queue-Id: 95101563FF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108081-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,qti.qualcomm.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,outlook.com:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[outlook.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 05:16:03PM +0800, Junrui Luo wrote:
> fastrpc_get_args() uses find_vma() to look up the VMA for a user-provided
> pointer and compute a DMA address offset. When the address falls in a gap
> before the returned VMA, (ptr & PAGE_MASK) - vma->vm_start underflows,
> corrupting the DMA address sent to the DSP.
> 
> Replace find_vma() with vma_lookup(), which returns NULL when the address
> is not contained within any VMA.
> 
> Cc: stable@vger.kernel.org
> Fixes: 80f3afd72bd4 ("misc: fastrpc: consider address offset before sending to DSP")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

