Return-Path: <linux-arm-msm+bounces-84805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ECFCB15BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 23:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A238301F8E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 22:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4212C2EF65C;
	Tue,  9 Dec 2025 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0qlGT2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDNVWeCn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0334277819
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 22:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320756; cv=none; b=qwffgojwIKeZCD7F+0kekzjIt7ZQmfNF50P+Pfm5qVZXoqsYQYCh5w8VShpoyVRToeCMjO12HIuhn8DCbkRqVPAjNkWy+CfyvdPBSGsM+SLJSj/OqxICMVqvDhgjR16iFFNlnGTvUmaX6/HHNP8cpEgKKQyeqB4O5BWV3EEDnF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320756; c=relaxed/simple;
	bh=y5CcGvaFk55evFK/bk1JgiTHoZb0VTEQSA8k23TaLv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSBeaNDYk6YWWoNxKNQN/miE374b9a49duB532LlqPATWNncdZqKykLnX1Vz7lFsKEOarXCU18+am2iaZ4BMDmvSx+SHt16SrwRHSgoGNvJVhyhMjGWchrqcJQf3WBuZrsfVfdrnswftSujUf1ytm7HmL+wjsIG6XHy3cLFcRXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0qlGT2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDNVWeCn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MmSLq656291
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 22:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vw3eepaFtTiYpjknw5gqkL1uvwE3sqy8AP9FrVBEBIs=; b=N0qlGT2ElsSQrTSp
	KvYlpQH+k+LQGHJRPSF3Q/GE57gYGSBjuxfI6laNj+rcMyeroUqZUC5ZrwxsGJw0
	1EmQxh4Px8oUBaJnnYA4KiuFWHajusAmk2O/hr9NhM68WbCf/qOK4ScQDkDbz3k2
	Ao1OmStcd5JA6QDHyEPhcFNpBGicOeQkm2Jzomaf0mGXIwUCrMljp0DDgbGcSNtt
	q3kDcNL3RaD3PhIA3Cbv7mhosXnYwXTKFW0PCjQD2R8d3UYbAeC4Hwv/IVlitDPw
	VcSRuoPtOX6Yod4Md/YPA4V4W7JbBkFBcSnXYAXWOq1CpbFEpM6G88LO5FwOShIg
	Pa5xOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk526mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:52:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee27e24711so110326301cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 14:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765320753; x=1765925553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vw3eepaFtTiYpjknw5gqkL1uvwE3sqy8AP9FrVBEBIs=;
        b=SDNVWeCnGzzRQoPkKr6SHaJrLpsZW4OCch2IslvpS4/3XWPQeN3B05Egr7oxg7XEd+
         uNelGqZ8ny+BsZsIgav/LJXZpCmkmSDq3facI/JYSK1AXYiHr+6RJLTPpt8CvAqA61Gh
         vSanNSJB0B5sikiYLl9ACBNCQ9yi/kUUfIeD9gUbcwpWdvvyjvXRxf8aWLKdSRUJjVpb
         FnyQ2IJZUPyu0ztI7Gfmxdf5hOv59ZTXDCbuNdGLrQT0/Y2TpcpOj8OUo8s9ZusEfLbm
         tWJm13CvjfXV5TRtWig+r6W3MLgwzZvMsPBOSimv4rHiS37qQa880ZpKIqOqz2E8U7YM
         rC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765320753; x=1765925553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vw3eepaFtTiYpjknw5gqkL1uvwE3sqy8AP9FrVBEBIs=;
        b=vYe0SOoh5tlT9rrzDmShL7DiHfEpPs+JxQ8aR+BwHMODcH4RhJSoShM0T6+u3Mz6Y/
         3kJ+ntAs+iCgJzPjerTMYt8mjqEuSt/qaw2Qp9YyyQLwK3UGgA/MO37jphPlrDNQGXjD
         IU3FhGb1wtYFPqdnk5akcnvvgBqO+ZYiieaZ5Bkv4AeGICof4l+78gXPKYvpM964lbnF
         FgAHpTqgQNyn5Ws9JQaMYah+/lpSfgoiOqEvfndTMxwTTd2CjT56wMzcmkUgUNEHMugL
         tExhalUYAqfVfDiix1zJJyitzSVAtI8jFMU39oU/04eqK6dheQJJ5kjeytmZo0E5ZKRs
         slFA==
X-Forwarded-Encrypted: i=1; AJvYcCU7O/cxM9nnnTTnkSm8T4FcCrqRXesQwq1Sn5Mv5OWnFes2x7OrEh4xzXUnspOHLPnkXw/Aoi60ZG2GFsBC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6K/5eCzO352JNREM2Hznd3HquI8EfyYBDZ7R4xwIs1pvLo0aC
	/U3MQlG3vwn8hrT8RDNajekcFMHKiEoYL7MMSjY/Nl1J/d0AXPpwGPTmU5v8D7Bb1Bk/kJPGtAl
	+0Ls1EvzuqPvqk8hqWo6sMMEQ6NWkZ0J3O9nQqCmaE0N8V6IapP2ZrOc+PnaMQzKHDxOW
X-Gm-Gg: ASbGncuxU6a6mR1lspDurYFVY+ovkLTS71iPNijTRy2rQmJ8a+3rS07ymBciLi+SEJ1
	/QFJ20ISDF/RLOI3RAaCH83161b6N22EVV76Fg7RjPagKMxE2VxB+BfJEvtH5m6rIQSlzAG4Fsg
	J4jtf0xxkTPn1Q4JmdjppfSG/TFPodPL0hy1fm0zC4+bcMGqpKZEWIiudMuOHGuXxoQRBFbnYHI
	educP/DSVOr259Ad4+Twinfx/1+5KUlyO9rpmHVQ7iCfZ3eOc303yId1hVTrnJTV+5yRWKjwTGx
	5EfNxOGI2QV64ux3IUaz0PEH0ckJ7Umyqx/R7c3ewBOpEBi6vRtE7UMNp6AhgExMZdIKbh+8Rss
	L3w5YkzZDevoZoJ5575cVKSBZgSTefiUySr6JyWIfjAiwEgkxJbFh6nZfQeKOrE2/ltKPr7znux
	rj7SmF+P7bbpR6rIkXD+E64Es=
X-Received: by 2002:a05:622a:8388:b0:4ee:16a8:dcf with SMTP id d75a77b69052e-4f1b1a7dbe5mr3900211cf.46.1765320752891;
        Tue, 09 Dec 2025 14:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkGvpFIuZ4h8q9ad8r80zo6A4P8mFzYpKEdgdJKsvZ5JJ9CTGMl2MYitE7FZWqI7F5OOE5sQ==
X-Received: by 2002:a05:622a:8388:b0:4ee:16a8:dcf with SMTP id d75a77b69052e-4f1b1a7dbe5mr3899931cf.46.1765320752416;
        Tue, 09 Dec 2025 14:52:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c281b7sm5487519e87.80.2025.12.09.14.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:52:31 -0800 (PST)
Date: Wed, 10 Dec 2025 00:52:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <ro7g7m42ostyc5xirx53zp7fvyobzr6zfm3huy5thlf6kwocmo@etqhbev43nfk>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
 <mlyaklczl4ngeckk7nle2xwmmzmqlphi6d47octomc5tewohh7@ipc2ik3kqj6q>
 <18c6b95a-961d-4544-856d-7dc08f7d5d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18c6b95a-961d-4544-856d-7dc08f7d5d74@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FU4nyUPCW4yO0JHqqOnCKy0KDJv4gele
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3OCBTYWx0ZWRfX6aQWzEE8q9Lm
 hU/8RQU73FbqOJPlTA9Nfl2HZ9qmL0+dAWxFTH4iDzWl5NlLxekKFrN2iVQX8dTyUm1BkSdN0Ok
 n+/B9ZiMj/Woc9Lk5IFacF4pBJVJoZ1Divq0eO2rA+h+oLS8rLPMc+CnOTIFSDtdcPalsg+SE1E
 go+cCS2Sxh+G6t/+sHprrwcm6fnNF4sTIRpeFdq18w5enlYEU6W6OnSNecL+66otCi21xE6Dx1H
 eofDFCejogjtXlL7GmwFgtP9cWWtTSog8iDduZXMXHJLVjzG/lIV77FFk9XXtR6q13V2uz1diKF
 fjCuxELwfucxnLLFkYveVnK+07V4rfyL2Axz85ERcCEudFXpbK6Qq7SXZvkG6sInYEiSK1UzanD
 FjxznDlXUL2k5D8ybyCZK7h6ytbY8w==
X-Proofpoint-GUID: FU4nyUPCW4yO0JHqqOnCKy0KDJv4gele
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=6938a831 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=07XtER_QmKxSY4CyyCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090178

On Mon, Dec 08, 2025 at 12:56:18PM +0530, Kumari Pallavi wrote:
> 
> 
> On 12/6/2025 8:00 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 02, 2025 at 11:36:27AM +0530, Kumari Pallavi wrote:
> > > Implement the new IOVA formatting required by the DSP architecture change
> > > on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> > > physical address. This placement is necessary for the DSPs to correctly
> > > identify streams and operate as intended.
> > > To address this, set SID position to bit 56 via OF matching on the fastrpc
> > > node; otherwise, default to legacy 32-bit placement.
> > > This change ensures consistent SID placement across DSPs.
> > > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++++------
> > >   1 file changed, 41 insertions(+), 7 deletions(-)
> > > 
> > > @@ -789,7 +807,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
> > >   		map->dma_addr = sg_phys(map->table->sgl);
> > >   	} else {
> > >   		map->dma_addr = sg_dma_address(map->table->sgl);
> > > -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> > > +		map->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,
> > 
> > Drop type conversion. Hmm. Looking at it, would it be better:
> > 
> > map->dma_addr = fastrpc_compute_dma_addr(fl->sctx, sg_dma_address(map->table->sgl))
> > 
> 
> Thanks for the suggestion. To confirm: you’re proposing that the call site
> use a single helper returning the final DMA address, i.e.
> 
> map->dma_addr = fastrpc_compute_dma_addr(fl,
>                                          sg_dma_address(map->table->sgl));
> I can implement fastrpc_compute_dma_addr() as a thin wrapper that internally
> calls our existing fastrpc_compute_sid_offset() and composes the
> consolidated IOVA (SID in upper bits, base DMA/PA in lower bits)
> ?

Yes

> 
> 
> > > +				 fl->cctx->soc_data->sid_pos);
> > >   	}
> > >   	for_each_sg(map->table->sgl, sgl, map->table->nents,
> > >   		sgl_index)

-- 
With best wishes
Dmitry

