Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C0E31EDA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbhBRRsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:48:09 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39322 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233926AbhBRRP5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 12:15:57 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11IH2Hsm025869;
        Thu, 18 Feb 2021 18:14:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FKu9hAFwKbK54X9LStJOfdhqjR42nJOoMInpWiJfAOg=;
 b=n2iWMUhKqJGwqpRDvQEQz00gAX+Z2EGWNZO/DhtudiEi+wQzWaJkuOvH9xJA1YYvIIIl
 kFrg51jRSIA4Q/b7tCVFobRu8vPIUM17VvtigsU7MZU7K2HYA8riwMEz+7/Ocf9sZWyt
 ZpwAkNiOHhAEQf1Yzt/9iDF3RctbnsGjfo9DFUmOoDSN1ldh39VbwlVMp1kag/Z/yrJd
 wA9CRgBscxb4piJUSotBH3eEaBDx8uFV1FwurBmiwMxHHWdKWYOgHN/nlCmJ72Go9ZTX
 p04/wYUN9pi+soPFuIcHnmPZns0Vsu45wUYMZq21j2o7ReHWxzcivyz9N1ulH57yrBPs EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p706wsej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Feb 2021 18:14:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D14010002A;
        Thu, 18 Feb 2021 18:14:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28AA125D03E;
        Thu, 18 Feb 2021 18:14:38 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Feb
 2021 18:14:37 +0100
Subject: Re: [PATCH v4 11/16] rpmsg: virtio: register the rpmsg_ctrl device
To:     Dan Carpenter <dan.carpenter@oracle.com>, <kbuild@lists.01.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <lkp@intel.com>, <kbuild-all@lists.01.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210218122715.GJ2087@kadam>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <d8259e24-d470-ceb9-5d79-3258628c4823@foss.st.com>
Date:   Thu, 18 Feb 2021 18:14:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210218122715.GJ2087@kadam>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-18_08:2021-02-18,2021-02-18 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dan,

On 2/18/21 1:27 PM, Dan Carpenter wrote:
> Hi Arnaud,
> 
> url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210217-214044
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f40ddce88593482919761f74910f42f4b84c004b
> config: x86_64-randconfig-m001-20210215 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/rpmsg/virtio_rpmsg_bus.c:977 rpmsg_probe() error: uninitialized symbol 'vch'.
> 
> vim +/vch +977 drivers/rpmsg/virtio_rpmsg_bus.c
> 
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  845  static int rpmsg_probe(struct virtio_device *vdev)
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  846  {
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  847  	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
> f7ad26ff952b3c Stefan Hajnoczi      2015-12-17  848  	static const char * const names[] = { "input", "output" };
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  849  	struct virtqueue *vqs[2];
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  850  	struct virtproc_info *vrp;
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  851  	struct virtio_rpmsg_channel *vch;
> e3bba4363fe87b Arnaud Pouliquen     2021-02-17  852  	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl = NULL;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  853  	void *bufs_va;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  854  	int err = 0, i;
> b1b9891441fa33 Suman Anna           2014-09-16  855  	size_t total_buf_space;
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  856  	bool notify;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  857  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  858  	vrp = kzalloc(sizeof(*vrp), GFP_KERNEL);
> 
> You might want to consider updating this stuff to devm_kzalloc() which
> is trendy with the kids these days.  It's cleaned up automatically when
> the module is released.
> 
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  859  	if (!vrp)
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  860  		return -ENOMEM;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  861  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  862  	vrp->vdev = vdev;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  863  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  864  	idr_init(&vrp->endpoints);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  865  	mutex_init(&vrp->endpoints_lock);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  866  	mutex_init(&vrp->tx_lock);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  867  	init_waitqueue_head(&vrp->sendq);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  868  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  869  	/* We expect two virtqueues, rx and tx (and in this order) */
> 9b2bbdb2275884 Michael S. Tsirkin   2017-03-06  870  	err = virtio_find_vqs(vdev, 2, vqs, vq_cbs, names, NULL);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  871  	if (err)
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  872  		goto free_vrp;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  873  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  874  	vrp->rvq = vqs[0];
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  875  	vrp->svq = vqs[1];
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  876  
> b1b9891441fa33 Suman Anna           2014-09-16  877  	/* we expect symmetric tx/rx vrings */
> b1b9891441fa33 Suman Anna           2014-09-16  878  	WARN_ON(virtqueue_get_vring_size(vrp->rvq) !=
> b1b9891441fa33 Suman Anna           2014-09-16  879  		virtqueue_get_vring_size(vrp->svq));
> b1b9891441fa33 Suman Anna           2014-09-16  880  
> b1b9891441fa33 Suman Anna           2014-09-16  881  	/* we need less buffers if vrings are small */
> b1b9891441fa33 Suman Anna           2014-09-16  882  	if (virtqueue_get_vring_size(vrp->rvq) < MAX_RPMSG_NUM_BUFS / 2)
> b1b9891441fa33 Suman Anna           2014-09-16  883  		vrp->num_bufs = virtqueue_get_vring_size(vrp->rvq) * 2;
> b1b9891441fa33 Suman Anna           2014-09-16  884  	else
> b1b9891441fa33 Suman Anna           2014-09-16  885  		vrp->num_bufs = MAX_RPMSG_NUM_BUFS;
> b1b9891441fa33 Suman Anna           2014-09-16  886  
> f93848f9eeb0f8 Loic Pallardy        2017-03-28  887  	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> f93848f9eeb0f8 Loic Pallardy        2017-03-28  888  
> f93848f9eeb0f8 Loic Pallardy        2017-03-28  889  	total_buf_space = vrp->num_bufs * vrp->buf_size;
> b1b9891441fa33 Suman Anna           2014-09-16  890  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  891  	/* allocate coherent memory for the buffers */
> d999b622fcfb39 Loic Pallardy        2019-01-10  892  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> b1b9891441fa33 Suman Anna           2014-09-16  893  				     total_buf_space, &vrp->bufs_dma,
> b1b9891441fa33 Suman Anna           2014-09-16  894  				     GFP_KERNEL);
> 3119b487e03650 Wei Yongjun          2013-04-29  895  	if (!bufs_va) {
> 3119b487e03650 Wei Yongjun          2013-04-29  896  		err = -ENOMEM;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  897  		goto vqs_del;
> 3119b487e03650 Wei Yongjun          2013-04-29  898  	}
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  899  
> de4064af76537f Suman Anna           2018-10-23  900  	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
> 8d95b322ba34b1 Anna, Suman          2016-08-12  901  		bufs_va, &vrp->bufs_dma);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  902  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  903  	/* half of the buffers is dedicated for RX */
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  904  	vrp->rbufs = bufs_va;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  905  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  906  	/* and half is dedicated for TX */
> b1b9891441fa33 Suman Anna           2014-09-16  907  	vrp->sbufs = bufs_va + total_buf_space / 2;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  908  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  909  	/* set up the receive buffers */
> b1b9891441fa33 Suman Anna           2014-09-16  910  	for (i = 0; i < vrp->num_bufs / 2; i++) {
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  911  		struct scatterlist sg;
> f93848f9eeb0f8 Loic Pallardy        2017-03-28  912  		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  913  
> 9dd87c2af651b0 Loic Pallardy        2017-03-28  914  		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  915  
> cee51d69a45b6c Rusty Russell        2013-03-20  916  		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  917  					  GFP_KERNEL);
> 57e1a37347d31c Rusty Russell        2012-10-16  918  		WARN_ON(err); /* sanity check; this can't really happen */
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  919  	}
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  920  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  921  	/* suppress "tx-complete" interrupts */
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  922  	virtqueue_disable_cb(vrp->svq);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  923  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  924  	vdev->priv = vrp;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  925  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  926  	/* if supported by the remote processor, enable the name service */
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  927  	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  928  		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  929  		if (!vch) {
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  930  			err = -ENOMEM;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  931  			goto free_coherent;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  932  		}
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  933  
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  934  		/* Link the channel to our vrp */
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  935  		vch->vrp = vrp;
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  936  
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  937  		/* Assign public information to the rpmsg_device */
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  938  		rpdev_ns = &vch->rpdev;
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  939  		rpdev_ns->ops = &virtio_rpmsg_ops;
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  940  		rpdev_ns->little_endian = virtio_is_little_endian(vrp->vdev);
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  941  
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  942  		rpdev_ns->dev.parent = &vrp->vdev->dev;
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  943  		rpdev_ns->dev.release = virtio_rpmsg_release_device;
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  944  
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  945  		err = rpmsg_ns_register_device(rpdev_ns);
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  946  		if (err)
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20  947  			goto free_coherent;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  948  	}
> 
> "vch" not initialized on else path.  Also keep in mind that "rpdev_ctrl"
> is NULL at this point.
> 
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  949  
> e3bba4363fe87b Arnaud Pouliquen     2021-02-17  950  	rpdev_ctrl = rpmsg_virtio_add_char_dev(vdev);
>                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> e3bba4363fe87b Arnaud Pouliquen     2021-02-17  951  	if (IS_ERR(rpdev_ctrl)) {
> e3bba4363fe87b Arnaud Pouliquen     2021-02-17  952  		err = PTR_ERR(rpdev_ctrl);
> e3bba4363fe87b Arnaud Pouliquen     2021-02-17  953  		goto free_coherent;
> 
> I should create a Smatch warning for this as well.
> 
> e3bba4363fe87b Arnaud Pouliquen     2021-02-17  954  	}
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  955  	/*
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  956  	 * Prepare to kick but don't notify yet - we can't do this before
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  957  	 * device is ready.
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  958  	 */
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  959  	notify = virtqueue_kick_prepare(vrp->rvq);
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  960  
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  961  	/* From this point on, we can notify and get callbacks. */
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  962  	virtio_device_ready(vdev);
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  963  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  964  	/* tell the remote processor it can start sending messages */
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  965  	/*
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  966  	 * this might be concurrent with callbacks, but we are only
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  967  	 * doing notify, not a full kick here, so that's ok.
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  968  	 */
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  969  	if (notify)
> 71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  970  		virtqueue_notify(vrp->rvq);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  971  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  972  	dev_info(&vdev->dev, "rpmsg host is online\n");
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  973  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  974  	return 0;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  975  
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  976  free_coherent:
> 950a7388f02bf7 Arnaud Pouliquen     2020-11-20 @977  	kfree(vch);
>                                                         ^^^^^^^^^^
> Uninitalized.
> 
> e3bba4363fe87b Arnaud Pouliquen     2021-02-17  978  	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
> 
> Now, let's say that "rpdev_ctrl" is NULL.  That's fine because
> to_virtio_rpmsg_channel() is a no-op so it becomes kfree(NULL) which
> is a no-op.  But why even have the to_virtio_rpmsg_channel() function
> if we are going to rely on it being a no-op?
> 
> If "rpdev_ctrl" is an error pointer this will crash.  The problem is we
> are freeing stuff that was not allocated.  The fix for this is:
> 
> 1) Free the most recent successful allocation.
> 2) The unwind code should mirror the allocation code.
> 3) Choose label names which say what the goto does.  If the most recent
>    allocation was "vch" the goto should be "goto free_vch;"
> 4) Every allocation function should have a matching free function.  It's
>    a layering violation to have to know that the internals of
>    rpmsg_virtio_add_char_dev().
> 
> So create function:
> 
> void rpmsg_virtio_del_char_dev(struct rpmsg_device *rpdev_ctrl)
> {
> 	if (!rpdev_ctrl)
> 		return;
> 	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
> }
> 
> The clean up code looks like this:
> 
> 	return 0;
> 
> free_vch:
> 	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS))
> 		kfree(vch);
> free_ctrl:
> 	rpmsg_virtio_del_char_dev(rpdev_ctrl);
> free_coherent:
> 	dma_free_coherent(vdev->dev.parent, total_buf_space,
> 			  bufs_va, vrp->bufs_dma);
> vqs_del:
> 	vdev->config->del_vqs(vrp->vdev);
> 
> Then just go through the function and as you read down the code keep
> track of the most recent successful allocation and goto the correct
> free label.

You're right, my error management is very bad here. I will fix this based on
your recommandation.

Thanks,
Arnaud

> 
> d999b622fcfb39 Loic Pallardy        2019-01-10  979  	dma_free_coherent(vdev->dev.parent, total_buf_space,
> eeb0074f36d1ab Fernando Guzman Lugo 2012-08-29  980  			  bufs_va, vrp->bufs_dma);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  981  vqs_del:
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  982  	vdev->config->del_vqs(vrp->vdev);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  983  free_vrp:
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  984  	kfree(vrp);
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  985  	return err;
> bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  986  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
