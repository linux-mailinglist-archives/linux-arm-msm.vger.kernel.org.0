Return-Path: <linux-arm-msm+bounces-94837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFfIC2NipWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:11:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDDE1D620C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9219A3028C05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DAF399006;
	Mon,  2 Mar 2026 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xcg6uVOK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuRpuLAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91351395DB1
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446021; cv=none; b=uJgeVBXmbZIrCGDbXEu0a8lKwB8Z4guv7f4KWjBLalsSK3lSVGUT3CoKrP7UnRzmzWPHqctuIhZl6C7PZbTS28GyFtGwecUgM3FdH/MDhsEYQq1qLngUDojvG3fI5qdYqdself1rfvXjh9bkJRJE6A54VY+zrVtbprXgbTAdA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446021; c=relaxed/simple;
	bh=1DisLIAJV5f9N5mygvvEdeA1ect3ZFTltH4gxuXT7+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsvW1BVuM5XYqTme77h9DlxvcnZC7q0ckpNiiMizwHB2cvuyiTCPkLU8bHY45GHHJNE8FL5RFXnBawMv1vPJddkCUUdQf9Kvaoqsp2FiAoKBmhwTapOIBlVe05T/h4eJ1pg4mrT1xQ4qjT9ihkfQOQ7vrTph0f4a0woI8dmzKLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xcg6uVOK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuRpuLAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228J2iQ3223945
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OGeYPCNNHRhay6FzvSoj6pnDvuy3D3mqjeiMDVTRH9E=; b=Xcg6uVOKgKndd7co
	3rFf1oXMfh6VM7NFALBGz2ccMSVoQA35ZMdijMa4ZUvlMWy9rbTq5Z2G//DbZMse
	ohYZwVzLgI7kaN3LeQv0rj7mLjO4GMgLx7uonAFUdo9REx80PR4+BWp8NudXb1zU
	V5qz6GAUa/34qe1SOhSTZeBSmr6rsQyMOqI2AueQ+ZggQzYWTRyRWs7MdQPUNWct
	2PhXpD0kn3amemCKlvOo3CuztPAhmWHmeV5N4RSlYZnE6D9dLJ+S4su9vswbEyYR
	AjF2lxZ804A9c/odnaJ255QDTTTrUb9MPg5SxHSd/dUFAd2g3qcpN7B/vO517JQ/
	01PS5A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1hpmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:07:00 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45f1665f706so49043532b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446019; x=1773050819; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OGeYPCNNHRhay6FzvSoj6pnDvuy3D3mqjeiMDVTRH9E=;
        b=TuRpuLALgaHWhbZqx92vnFQ1/sW/am1CpyxVNMnslsdZ5DWBQeypzAWpOSrh9jIssF
         l2Oobvesd4JKggaGLM+CuyuZ7N/Zr5ts80A62pczhItu5S6zlGJXtRGqESfqNSfW5COR
         fWgQDC6PotB9HdbkkVc0VQV10QUSrORHIqcdjiK07MZBdcrN0DSOyoq4gaFIdnALTigE
         uFnjpIt6b7szqafsPpjEHUuwPQgL/ubESuvpnxnRQKuS6XF6M9tCgA1KaXrTQCwj3kA0
         aWOp92kdJug8DwJTzY90pHir4aS2HQRBuVEnEByEc+/iSayrJp+1A5aafKb8KfkNnnwi
         9UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446019; x=1773050819;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGeYPCNNHRhay6FzvSoj6pnDvuy3D3mqjeiMDVTRH9E=;
        b=cuQBZy3YXLsnsJW4T+mZbtX/pH7WFGrRyPfhyhozSlC+tQih92Tc9ZmYdhsFOIgAyS
         MWhp0lkeB66Cv2afo80mzzdQc09nHTC3V8XQdAwlurPATPtJfQ/+LOJ95CC1MDzdDZrY
         fa1TbATzttkdIKMb+eyizm47nMdK7IYSiXaRczqZiWlWelqPy29mnn9oTdG676nw0TQX
         jc0TClzNA1rlEwF4hSvS2yH5jjakyNWqy2B6aurdxdFN9zWmOaO7CxOtK1C59975Q1D+
         pvKrABQao1oSf1Tooxid0mu50FRGibdO6EPVFw6oy8V9vBqX3GX7rz3NBELDwJsK3qU/
         6JzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4KdANRwWhn8SPvrDIGA9ywxBGFmyxjp64nZa6NR5R/V0+i/ewg5zji9k7oyTMaukCaxmT3/4rhs6kzbUw@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvuQzrRH/twk5z190pa9DkXIyfY50KEW5wm5r0RPg2kKQ7ZsI
	clkTyyYS6Q45U1s6r3MtAhA1L9V8LKoPRyAdO4b3/AlhJiseNqmvMVGxGtPQpv8VJ4sMvmLTQRg
	+lcp0QtEsBem6w8umYQhZtM+h+RY3HZpTDxnF+u2+M7aACR5bc9N8G2d61jaSSTWwpuw4
X-Gm-Gg: ATEYQzw5/bgAvCnquHMj/QoSIfbKCcArROaYGDbZuGb1JfbVEMl0L4hfeF0UVRaWTQJ
	nyVlGDwwqBhxs9Ly+M4x3C5IZxH8cwYD6342vVYJBqBapu//SHeZFwoN0EpeqkwRgO7ml1cUt2i
	/FBp6WeZWECshwMqyUTG0nfqUbDKZYDME7/sGl8K/yzTL0J++XRxyqB1Og7sUz5Wgxbtqrf2ttT
	gFWJHRCF0ziMoRreiS2AaTJ8WVJrYREJHWZJyv49pgd1f/bs9HE6hUB7x2tN0pqFY0nJtUoZAav
	XBouXq3OcC77IU5QLgP8hUDulTY/a7K+g62KEB/uBR95DIil/CIiCoSQ3Z2pcFvNQ8DfpG3+6do
	fxDAUIThjSKWECJrqEQGjXXLs9Yjz2VbX/I0xukWShKHvE0JmGSP3/lZNV3+lCRMG2YMj
X-Received: by 2002:a05:6808:191b:b0:45e:b647:ef5a with SMTP id 5614622812f47-464be9489famr5887252b6e.3.1772446019281;
        Mon, 02 Mar 2026 02:06:59 -0800 (PST)
X-Received: by 2002:a05:6808:191b:b0:45e:b647:ef5a with SMTP id 5614622812f47-464be9489famr5887237b6e.3.1772446018802;
        Mon, 02 Mar 2026 02:06:58 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41668233c4bsm2789197fac.19.2026.03.02.02.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:06:58 -0800 (PST)
Date: Mon, 2 Mar 2026 02:06:56 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Switch to async power up to
 avoid boot delays
Message-ID: <aaVhQKZUd+53Uwtl@hu-qianyu-lv.qualcomm.com>
References: <20260122-mhi_async_probe-v1-1-b5cb2a3629d0@oss.qualcomm.com>
 <vnqrsrglpmzizk2vtee3aohuwop5wynd463bkq6kknq4ploiox@frv5z5yk3kha>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vnqrsrglpmzizk2vtee3aohuwop5wynd463bkq6kknq4ploiox@frv5z5yk3kha>
X-Proofpoint-GUID: UZqIHoGxO4BT1lt3nri-dqZiC86FUp6T
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a56144 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yFp2A1wA7JFfkWW7:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mBkwmRZnPUGkx-IFPogA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: UZqIHoGxO4BT1lt3nri-dqZiC86FUp6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NCBTYWx0ZWRfX+87Xj8rsdtvu
 kqDET16Yw7C+1qTNq3mqu/Ramf3uJWl5FLTprpRnASW808JH1M3Jk6Ofp9IIVA1YcrQEuEWHNXi
 JT+MROq4NfvWLg+/n/953aAockWjJgcZUJQeseLdOvMcfMWXBCR3s3XJ7IaC9te6d6xSi6pzfu6
 2R6I0m4hYnSEV26troBCBcctyMYj94LbyJBxh+zjCDLzm00HsRlwIp7MYbvIWpvRLNHlH6qiWG/
 w1x5e6GMG6sEjp3utuUrqWKXFyHArk482/HQPmlBsJzlU/sHCrem70CB31KcTrtnIMshn+oO576
 PDsM2TC1o4YnHZuPE+LB7JuH+bIMYkscaZ+BqSEVH9HgFuYDdrJW6JXsuV8kKCkmBQH8+9fw4N7
 cZv78lmVRUKD6lM13oGQCj9/vQ77XaCCL8hp8iJ0gfuUR6RCsMIGEtAyy3+f5z1r6hqIPcBEVFC
 7d/FRG8aBTEm2262O5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FDDE1D620C
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:37:38PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Jan 22, 2026 at 12:53:48AM -0800, Qiang Yu wrote:
> > Some modem devices can take significant time (up to 20 secs for sdx75) to
> > enter mission mode during initialization. Currently, mhi_sync_power_up()
> > waits for this entire process to complete, blocking other driver probes
> > and delaying system boot.
> > 
> > Switch to mhi_async_power_up() so probe can return immediately while MHI
> > initialization continues in the background. This eliminates lengthy boot
> > delays and allows other drivers to probe in parallel, improving overall
> > system boot performance.
> > 
> 
> This part is fine.
> 
> > Add pm_runtime_forbid() in remove path to prevent device suspend during
> > driver reinstallation. This issue is specific to async power up: with
> > sync power up, pm_runtime_put_noidle() is called after mission mode is
> > reached because mhi_sync_power_up() waits for mission mode event. With
> > async power up, pm_runtime_put_noidle() is called immediately while power
> > up process continues in background, which can cause the device to
> > suspend and mhi init fail if pm_runtime_allow() from a previous probe
> > is still active.
> > 
> 
> pm_runtime_forbid() should be called at the start of the remove() callback to
> prevent the device from auto suspending during cleanup and to fix the issue you
> described above.
> 
> So do in a separate patch and add a Fixes tag pointing to the commit that added
> the Runtime PM support.
>

I can implement this in a separate patch as it also serves as a cleanup to
call pm_runtime_forbid() in the remove callback, since we call
pm_runtime_allow() in our driver. However, I cannot call it at the start
of the remove() callback. Before the remove callback is invoked,
pci_device_remove() calls pm_runtime_get_sync(dev) first, so we don't need
to worry about auto-suspend during removal.

Since we use mhi_async_power_up(), there's a race condition where the
mhi_pci_generic driver could be removed after mission mode is reached but
before pm_runtime_allow() is called as part of mhi_status_cb(). In this
scenario, the pm_runtime_forbid() operation would be ineffective, and when
the driver is reinstalled next time, MHI read operations will fail during
initialization because the previous pm_runtime_allow() state was not
properly cleared.

- Qiang Yu
> - Mani
> 
> > Fixes: 5571519009d0 ("bus: mhi: host: pci_generic: Add SDX75 based modem support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > index 0884a384b77fc3f56fa62a12351933132ffc9293..fc0952e46ae5e4854c7165ed60b850729843d458 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -1393,7 +1393,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  		goto err_unregister;
> >  	}
> >  
> > -	err = mhi_sync_power_up(mhi_cntrl);
> > +	err = mhi_async_power_up(mhi_cntrl);
> >  	if (err) {
> >  		dev_err(&pdev->dev, "failed to power up MHI controller\n");
> >  		goto err_unprepare;
> > @@ -1447,6 +1447,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> >  		mhi_soc_reset(mhi_cntrl);
> >  
> >  	mhi_unregister_controller(mhi_cntrl);
> > +	pm_runtime_forbid(&pdev->dev);
> >  }
> >  
> >  static void mhi_pci_shutdown(struct pci_dev *pdev)
> > 
> > ---
> > base-commit: 91a0b0dce350766675961892ba4431363c4e29f7
> > change-id: 20260113-mhi_async_probe-a7b0867b6e2e
> > 
> > Best regards,
> > -- 
> > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

