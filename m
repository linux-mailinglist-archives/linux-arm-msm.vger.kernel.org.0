Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B74C31EAE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 15:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhBROXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 09:23:18 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55954 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbhBRM27 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 07:28:59 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11ICPcPW053030;
        Thu, 18 Feb 2021 12:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=+L7xFlB4Jg8JQqJWksc18Xt9BgXvXPkLR1og01WH1Zg=;
 b=zu/eBgUSZ/hxvbw6fq+/jQJVTsbk5+iYy0fUfgUx0Mj5+86ZXnxtm1t+t6Nl/HWluP7W
 10x+MgA0wRzxG7B9qN6Ha3O5ViYVnigVl7z1OipY8mfuhqS+xZgIVKVi6mN1UCO1Yf7i
 Gx/L+H37SHUOOVAYcLbCJh5Hcm0E8K8k5YyO+SAejRcMEhNbLdSthp6AP2vBsxUZQB5Z
 JEYy9KCmy7KRVPISj81RovXeA1mW+Aihf574coMRgL92BGDp2xB9BsHj+os6281b5AZS
 ui6GOMWpAjbmu0cJcVc8pyN0iKQnYAfRd4SOU2dnpvejayZVJ0zYy+DQGywyQsO1Eufm 3Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 36p49bdwm9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Feb 2021 12:27:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11ICKWUn171270;
        Thu, 18 Feb 2021 12:27:32 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 36prbqq1ka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Feb 2021 12:27:32 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11ICRS6W000599;
        Thu, 18 Feb 2021 12:27:28 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 18 Feb 2021 04:27:26 -0800
Date:   Thu, 18 Feb 2021 15:27:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com
Subject: Re: [PATCH v4 11/16] rpmsg: virtio: register the rpmsg_ctrl device
Message-ID: <20210218122715.GJ2087@kadam>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="j13PAD5Nz8dz2ik7"
Content-Disposition: inline
In-Reply-To: <20210217132905.1485-12-arnaud.pouliquen@foss.st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9898 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102180110
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9898 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180110
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--j13PAD5Nz8dz2ik7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnaud,

url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210217-214044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f40ddce88593482919761f74910f42f4b84c004b
config: x86_64-randconfig-m001-20210215 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rpmsg/virtio_rpmsg_bus.c:977 rpmsg_probe() error: uninitialized symbol 'vch'.

vim +/vch +977 drivers/rpmsg/virtio_rpmsg_bus.c

bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  845  static int rpmsg_probe(struct virtio_device *vdev)
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  846  {
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  847  	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
f7ad26ff952b3c Stefan Hajnoczi      2015-12-17  848  	static const char * const names[] = { "input", "output" };
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  849  	struct virtqueue *vqs[2];
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  850  	struct virtproc_info *vrp;
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  851  	struct virtio_rpmsg_channel *vch;
e3bba4363fe87b Arnaud Pouliquen     2021-02-17  852  	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl = NULL;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  853  	void *bufs_va;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  854  	int err = 0, i;
b1b9891441fa33 Suman Anna           2014-09-16  855  	size_t total_buf_space;
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  856  	bool notify;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  857  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  858  	vrp = kzalloc(sizeof(*vrp), GFP_KERNEL);

You might want to consider updating this stuff to devm_kzalloc() which
is trendy with the kids these days.  It's cleaned up automatically when
the module is released.

bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  859  	if (!vrp)
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  860  		return -ENOMEM;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  861  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  862  	vrp->vdev = vdev;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  863  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  864  	idr_init(&vrp->endpoints);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  865  	mutex_init(&vrp->endpoints_lock);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  866  	mutex_init(&vrp->tx_lock);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  867  	init_waitqueue_head(&vrp->sendq);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  868  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  869  	/* We expect two virtqueues, rx and tx (and in this order) */
9b2bbdb2275884 Michael S. Tsirkin   2017-03-06  870  	err = virtio_find_vqs(vdev, 2, vqs, vq_cbs, names, NULL);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  871  	if (err)
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  872  		goto free_vrp;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  873  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  874  	vrp->rvq = vqs[0];
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  875  	vrp->svq = vqs[1];
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  876  
b1b9891441fa33 Suman Anna           2014-09-16  877  	/* we expect symmetric tx/rx vrings */
b1b9891441fa33 Suman Anna           2014-09-16  878  	WARN_ON(virtqueue_get_vring_size(vrp->rvq) !=
b1b9891441fa33 Suman Anna           2014-09-16  879  		virtqueue_get_vring_size(vrp->svq));
b1b9891441fa33 Suman Anna           2014-09-16  880  
b1b9891441fa33 Suman Anna           2014-09-16  881  	/* we need less buffers if vrings are small */
b1b9891441fa33 Suman Anna           2014-09-16  882  	if (virtqueue_get_vring_size(vrp->rvq) < MAX_RPMSG_NUM_BUFS / 2)
b1b9891441fa33 Suman Anna           2014-09-16  883  		vrp->num_bufs = virtqueue_get_vring_size(vrp->rvq) * 2;
b1b9891441fa33 Suman Anna           2014-09-16  884  	else
b1b9891441fa33 Suman Anna           2014-09-16  885  		vrp->num_bufs = MAX_RPMSG_NUM_BUFS;
b1b9891441fa33 Suman Anna           2014-09-16  886  
f93848f9eeb0f8 Loic Pallardy        2017-03-28  887  	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
f93848f9eeb0f8 Loic Pallardy        2017-03-28  888  
f93848f9eeb0f8 Loic Pallardy        2017-03-28  889  	total_buf_space = vrp->num_bufs * vrp->buf_size;
b1b9891441fa33 Suman Anna           2014-09-16  890  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  891  	/* allocate coherent memory for the buffers */
d999b622fcfb39 Loic Pallardy        2019-01-10  892  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
b1b9891441fa33 Suman Anna           2014-09-16  893  				     total_buf_space, &vrp->bufs_dma,
b1b9891441fa33 Suman Anna           2014-09-16  894  				     GFP_KERNEL);
3119b487e03650 Wei Yongjun          2013-04-29  895  	if (!bufs_va) {
3119b487e03650 Wei Yongjun          2013-04-29  896  		err = -ENOMEM;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  897  		goto vqs_del;
3119b487e03650 Wei Yongjun          2013-04-29  898  	}
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  899  
de4064af76537f Suman Anna           2018-10-23  900  	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
8d95b322ba34b1 Anna, Suman          2016-08-12  901  		bufs_va, &vrp->bufs_dma);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  902  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  903  	/* half of the buffers is dedicated for RX */
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  904  	vrp->rbufs = bufs_va;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  905  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  906  	/* and half is dedicated for TX */
b1b9891441fa33 Suman Anna           2014-09-16  907  	vrp->sbufs = bufs_va + total_buf_space / 2;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  908  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  909  	/* set up the receive buffers */
b1b9891441fa33 Suman Anna           2014-09-16  910  	for (i = 0; i < vrp->num_bufs / 2; i++) {
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  911  		struct scatterlist sg;
f93848f9eeb0f8 Loic Pallardy        2017-03-28  912  		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  913  
9dd87c2af651b0 Loic Pallardy        2017-03-28  914  		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  915  
cee51d69a45b6c Rusty Russell        2013-03-20  916  		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  917  					  GFP_KERNEL);
57e1a37347d31c Rusty Russell        2012-10-16  918  		WARN_ON(err); /* sanity check; this can't really happen */
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  919  	}
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  920  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  921  	/* suppress "tx-complete" interrupts */
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  922  	virtqueue_disable_cb(vrp->svq);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  923  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  924  	vdev->priv = vrp;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  925  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  926  	/* if supported by the remote processor, enable the name service */
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  927  	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  928  		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  929  		if (!vch) {
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  930  			err = -ENOMEM;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  931  			goto free_coherent;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  932  		}
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  933  
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  934  		/* Link the channel to our vrp */
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  935  		vch->vrp = vrp;
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  936  
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  937  		/* Assign public information to the rpmsg_device */
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  938  		rpdev_ns = &vch->rpdev;
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  939  		rpdev_ns->ops = &virtio_rpmsg_ops;
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  940  		rpdev_ns->little_endian = virtio_is_little_endian(vrp->vdev);
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  941  
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  942  		rpdev_ns->dev.parent = &vrp->vdev->dev;
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  943  		rpdev_ns->dev.release = virtio_rpmsg_release_device;
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  944  
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  945  		err = rpmsg_ns_register_device(rpdev_ns);
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  946  		if (err)
950a7388f02bf7 Arnaud Pouliquen     2020-11-20  947  			goto free_coherent;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  948  	}

"vch" not initialized on else path.  Also keep in mind that "rpdev_ctrl"
is NULL at this point.

bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  949  
e3bba4363fe87b Arnaud Pouliquen     2021-02-17  950  	rpdev_ctrl = rpmsg_virtio_add_char_dev(vdev);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

e3bba4363fe87b Arnaud Pouliquen     2021-02-17  951  	if (IS_ERR(rpdev_ctrl)) {
e3bba4363fe87b Arnaud Pouliquen     2021-02-17  952  		err = PTR_ERR(rpdev_ctrl);
e3bba4363fe87b Arnaud Pouliquen     2021-02-17  953  		goto free_coherent;

I should create a Smatch warning for this as well.

e3bba4363fe87b Arnaud Pouliquen     2021-02-17  954  	}
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  955  	/*
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  956  	 * Prepare to kick but don't notify yet - we can't do this before
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  957  	 * device is ready.
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  958  	 */
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  959  	notify = virtqueue_kick_prepare(vrp->rvq);
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  960  
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  961  	/* From this point on, we can notify and get callbacks. */
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  962  	virtio_device_ready(vdev);
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  963  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  964  	/* tell the remote processor it can start sending messages */
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  965  	/*
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  966  	 * this might be concurrent with callbacks, but we are only
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  967  	 * doing notify, not a full kick here, so that's ok.
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  968  	 */
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  969  	if (notify)
71e4b8bf0482fc Michael S. Tsirkin   2015-03-12  970  		virtqueue_notify(vrp->rvq);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  971  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  972  	dev_info(&vdev->dev, "rpmsg host is online\n");
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  973  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  974  	return 0;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  975  
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  976  free_coherent:
950a7388f02bf7 Arnaud Pouliquen     2020-11-20 @977  	kfree(vch);
                                                        ^^^^^^^^^^
Uninitalized.

e3bba4363fe87b Arnaud Pouliquen     2021-02-17  978  	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));

Now, let's say that "rpdev_ctrl" is NULL.  That's fine because
to_virtio_rpmsg_channel() is a no-op so it becomes kfree(NULL) which
is a no-op.  But why even have the to_virtio_rpmsg_channel() function
if we are going to rely on it being a no-op?

If "rpdev_ctrl" is an error pointer this will crash.  The problem is we
are freeing stuff that was not allocated.  The fix for this is:

1) Free the most recent successful allocation.
2) The unwind code should mirror the allocation code.
3) Choose label names which say what the goto does.  If the most recent
   allocation was "vch" the goto should be "goto free_vch;"
4) Every allocation function should have a matching free function.  It's
   a layering violation to have to know that the internals of
   rpmsg_virtio_add_char_dev().

So create function:

void rpmsg_virtio_del_char_dev(struct rpmsg_device *rpdev_ctrl)
{
	if (!rpdev_ctrl)
		return;
	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
}

The clean up code looks like this:

	return 0;

free_vch:
	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS))
		kfree(vch);
free_ctrl:
	rpmsg_virtio_del_char_dev(rpdev_ctrl);
free_coherent:
	dma_free_coherent(vdev->dev.parent, total_buf_space,
			  bufs_va, vrp->bufs_dma);
vqs_del:
	vdev->config->del_vqs(vrp->vdev);

Then just go through the function and as you read down the code keep
track of the most recent successful allocation and goto the correct
free label.

d999b622fcfb39 Loic Pallardy        2019-01-10  979  	dma_free_coherent(vdev->dev.parent, total_buf_space,
eeb0074f36d1ab Fernando Guzman Lugo 2012-08-29  980  			  bufs_va, vrp->bufs_dma);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  981  vqs_del:
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  982  	vdev->config->del_vqs(vrp->vdev);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  983  free_vrp:
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  984  	kfree(vrp);
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  985  	return err;
bcabbccabffe73 Ohad Ben-Cohen       2011-10-20  986  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--j13PAD5Nz8dz2ik7
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
dhZC5rQAgM8dmQPvAQA=

--j13PAD5Nz8dz2ik7--
